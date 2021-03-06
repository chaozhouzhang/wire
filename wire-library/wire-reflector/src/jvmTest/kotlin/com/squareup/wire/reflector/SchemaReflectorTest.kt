/*
 * Copyright 2021 Square Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.squareup.wire.reflector

import com.squareup.wire.schema.RepoBuilder
import grpc.reflection.v1alpha.ListServiceResponse
import grpc.reflection.v1alpha.ServerReflectionRequest
import grpc.reflection.v1alpha.ServerReflectionResponse
import grpc.reflection.v1alpha.ServiceResponse
import org.assertj.core.api.Assertions.assertThat
import org.junit.Test

internal class SchemaReflectorTest {
  @Test
  fun `outputs a list of services`() {
    val repoBuilder = RepoBuilder().addLocal("src/jvmTest/proto/RouteGuideProto.proto")
    val schema = repoBuilder.schema()

    assertThat(
      SchemaReflector(schema).process(
        ServerReflectionRequest(
          list_services = "*"
        )
      )
    ).isEqualTo(
      ServerReflectionResponse(
        list_services_response = ListServiceResponse(
          service = listOf(ServiceResponse(name = "routeguide.RouteGuide"))
        )
      )
    )
  }

  @Test
  fun `gets a file descriptor for a filename`() {
    val repoBuilder = RepoBuilder().addLocal("src/jvmTest/proto/RouteGuideProto.proto")
    val schema = repoBuilder.schema()

    assertThat(
      SchemaReflector(schema).process(
        ServerReflectionRequest(
          file_by_filename = "src/jvmTest/proto/RouteGuideProto.proto"
        )
      )
    ).extracting { it.file_descriptor_response }.isNotNull
  }

  @Test
  fun `gets a file descriptor for a specific symbol`() {
    val repoBuilder = RepoBuilder().addLocal("src/jvmTest/proto/RouteGuideProto.proto")
    val schema = repoBuilder.schema()

    assertThat(
      SchemaReflector(schema).process(
        ServerReflectionRequest(
          file_containing_symbol = "routeguide.RouteGuide"
        )
      )
    ).extracting { it.file_descriptor_response }.isNotNull
  }
}
