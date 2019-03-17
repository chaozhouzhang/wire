/*
 * Copyright (C) 2015 Square, Inc.
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
package com.squareup.wire.schema.internal.parser

import com.google.common.collect.ImmutableList
import com.squareup.wire.schema.Field.Label.OPTIONAL
import com.squareup.wire.schema.Field.Label.REQUIRED
import com.squareup.wire.schema.Location
import com.squareup.wire.schema.internal.parser.OptionElement.Kind
import org.assertj.core.api.Assertions.assertThat
import org.junit.Test

class FieldElementTest {
  internal var location = Location.get("file.proto")

  @Test
  fun field() {
    val field = FieldElement.builder(location)
        .label(OPTIONAL)
        .type("CType")
        .name("ctype")
        .tag(1)
        .options(
            ImmutableList.of(
                OptionElement.create("default", Kind.ENUM, "TEST"),
                OptionElement.create("deprecated", Kind.BOOLEAN, "true")
            )
        )
        .build()

    assertThat(field.options()).containsOnly(
        OptionElement.create("default", Kind.ENUM, "TEST"),
        OptionElement.create("deprecated", Kind.BOOLEAN, "true")
    )
  }

  @Test
  fun addMultipleOptions() {
    val kitKat = OptionElement.create("kit", Kind.STRING, "kat")
    val fooBar = OptionElement.create("foo", Kind.STRING, "bar")
    val field = FieldElement.builder(location)
        .label(REQUIRED)
        .type("string")
        .name("name")
        .tag(1)
        .options(ImmutableList.of(kitKat, fooBar))
        .build()

    assertThat(field.options()).hasSize(2)
  }
}