Return-Path: <linux-omap+bounces-5194-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBD5CC10BA
	for <lists+linux-omap@lfdr.de>; Tue, 16 Dec 2025 07:01:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D19D301412F
	for <lists+linux-omap@lfdr.de>; Tue, 16 Dec 2025 06:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1EE33468C;
	Tue, 16 Dec 2025 06:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YITzAch0"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581D131AF1F;
	Tue, 16 Dec 2025 06:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765864913; cv=none; b=eF9t1ZkG120Vr3/GpuDRWFsKBhgv0T6aODjPDByqIkdbkgrFrxZmSCtiJHdLVN+d9b3s0WAcc4VFjOXB+NNXHdU+sHl3Q6Gk9qjW9h61qt7MzgXIr7K6e/BETz3GEeKWITVPkHy3SZkEgZOnJAWLp6DqRM/Lo0p4YR4+ykWoG50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765864913; c=relaxed/simple;
	bh=I95cDlcRjf1+/2faDF4bEDUMeInHLZs8Kq3NLwEe++A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJ+J90x36QrTDX2oyTZOo3V9AJqjZIJzH58fHWLuFZfE5wylKgyqotKkiJL26MIknsw2FfO6pfjDHrsc+8ZOujHuZk3KMElTaEkJ+FD4zrgcFtqJrl1a2Zvqo+PeY61gWYi2ZrVIDCN9534tkaifl+UZQlsqi8JXPS7hwhBUXl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YITzAch0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D71C4CEF1;
	Tue, 16 Dec 2025 06:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765864911;
	bh=I95cDlcRjf1+/2faDF4bEDUMeInHLZs8Kq3NLwEe++A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YITzAch0mk5AlPQuPIPKdKc372t6AdmNCQ7JhwR1AzVoruoh4VvWmrgNNYMPwHYvN
	 B8trJ37+YZNC09WuHa3aK2dIOKZsu5m+MAAjxw3vXrtosM5PXcbh77W+Y+/KOnrSHS
	 YUyN9FnLNYC8z9HvFVqPxYQ0Spb9LIBXU7yF0XcYMiqymkGxAnqzYMP/bD3G+dmapt
	 chzyxvZbFb6tGPRA2DdfFm/CwBdVWqyJdO77Z4bCWIjAheZBaF6QnUuMY8KMiNg7Bg
	 yEz2QtlrBlyeMLzapXkH6xKysyJLiy1KjWfzJvx64DaX4PAqNiZ/QmEZiuyLNvFngk
	 d1ZXWB+U8k7fw==
Date: Tue, 16 Dec 2025 07:01:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Tony Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Markus Schneider-Pargmann <msp@baylibre.com>, 
	Bajjuri Praneeth <praneeth@ti.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Miguel Gazquez <miguel.gazquez@bootlin.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 01/20] dt-bindings: display: tilcdc: Convert to DT
 schema
Message-ID: <20251216-capable-eccentric-nightingale-b09037@quoll>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-1-f48bac3cd33e@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251211-feature_tilcdc-v2-1-f48bac3cd33e@bootlin.com>

On Thu, Dec 11, 2025 at 05:38:45PM +0100, Kory Maincent (TI.com) wrote:
> diff --git a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml
> new file mode 100644
> index 0000000000000..34ac1fd04d5c6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml

Filename based on compatible, so for example ti,am33xx-tilcdc.yaml or
worse case ti,tilcdc.yaml (see writing bindings and writing schema docs)


> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/tilcdc/tilcdc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI LCD Controller, found on AM335x, DA850, AM18x and OMAP-L138
> +
> +maintainers:
> +  - Kory Maincent <kory.maincent@bootlin.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,am33xx-tilcdc
> +      - ti,da850-tilcdc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +
> +  ti,hwmods:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      Name of the hwmod associated to the LCDC
> +
> +  max-bandwidth:

constraints? Is '1' valid? Is INT_MAX valid as well?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The maximum pixels per second that the memory interface / lcd
> +      controller combination can sustain
> +
> +  max-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32

constraints?

> +    description:
> +      The maximum horizontal pixel width supported by the lcd controller.
> +
> +  max-pixelclock:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The maximum pixel clock that can be supported by the lcd controller
> +      in KHz.
> +
> +  blue-and-red-wiring:
> +    enum: [straight, crossed]
> +    description:
> +      This property deals with the LCDC revision 2 (found on AM335x)
> +      color errata [1].
> +       - "straight" indicates normal wiring that supports RGB565,
> +         BGR888, and XBGR8888 color formats.
> +       - "crossed" indicates wiring that has blue and red wires
> +         crossed. This setup supports BGR565, RGB888 and XRGB8888
> +         formats.
> +       - If the property is not present or its value is not recognized
> +         the legacy mode is assumed. This configuration supports RGB565,
> +         RGB888 and XRGB8888 formats. However, depending on wiring, the red
> +         and blue colors are swapped in either 16 or 24-bit color modes.
> +
> +       [1] There is an errata about AM335x color wiring. For 16-bit color
> +       mode the wires work as they should (LCD_DATA[0:4] is for Blue[3:7]),
> +       but for 24 bit color modes the wiring of blue and red components is
> +       crossed and LCD_DATA[0:4] is for Red[3:7] and LCD_DATA[11:15] is
> +       for Blue[3-7]. For more details see section 3.1.1 in AM335x
> +       Silicon Errata
> +       https://www.ti.com/general/docs/lit/getliterature.tsp?baseLiteratureNumber=sprz360
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - reg
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    tilcdc: tilcdc@4830e000 {

Drop unused label. Generic node name, e.g. "display-controller" or
"lcd-controller".


Best regards,
Krzysztof


