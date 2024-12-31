Return-Path: <linux-omap+bounces-2928-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0D39FEE04
	for <lists+linux-omap@lfdr.de>; Tue, 31 Dec 2024 09:41:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF036188240F
	for <lists+linux-omap@lfdr.de>; Tue, 31 Dec 2024 08:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B3DE18FC8C;
	Tue, 31 Dec 2024 08:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMBUYSIG"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084BA188714;
	Tue, 31 Dec 2024 08:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735634497; cv=none; b=obnLirUj3+y8MzciESVBf5GbPbwMWIWtWjGYKBrHdfX7B3o4mIarfivw+F/27kG+7FK8iOcZ6ZISbGIvRk+x46zjSwa2ncaBU94EOJC4hx0i8Gqrf6gkAzt2qVwqrPYF8NFwoJ97wthGJVWfXmtIOdG8SEqSBuOLp8QJeIsG6EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735634497; c=relaxed/simple;
	bh=7K2vQxlK6gRcoCLTuXRbokQfJ4tzE9XGRr86hbTZHHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FX9KsDJmgn9Zz6UQPOElHoK1nTcCIRzjahfPnsxMNW/Z9utf+kKg/2yjNubqCXnr3lDqDvzb7W9wGhd5G/9lwJsLUoHCd1E8XfCCZjleMqRUbf2WfXiYLymmS27Fy3n/ZCa1zHEjFiApx1uJ5XQsZBo+D8T3hBLo9HYBwScTug0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMBUYSIG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 083FBC4CED6;
	Tue, 31 Dec 2024 08:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735634496;
	bh=7K2vQxlK6gRcoCLTuXRbokQfJ4tzE9XGRr86hbTZHHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DMBUYSIGJ6UnfMq+e8WGlih9vtdw+alyvWkYXHnfraot+1ukAV/A9ZgSwxh9odex9
	 CZVRM/NXILEpQrza5V2Deu9KgRGJySHjsGQc+qP/bC+s0DGpU8KGit6CT9JrEdIe2k
	 DIaWGpmW7v4KpseF8I/Uie5oN12KJP6o0TVvkimbECQc/yxHj/gkH2/TTO9I/FYDkS
	 Xnces+p6OwCYO9WHxBc3Kn7XbkbT+1YbUZGXUPxXHkCCMmXIem7Da5V8xKCdEAgk6F
	 l1CqjaFHjOiH4jg+7/h94Ifp+HEZ7CoG/KEj0uHa5msJavOHThBvBOyDSnluB8hqjx
	 avcg1cq/4bRIQ==
Date: Tue, 31 Dec 2024 09:41:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: mfd: motorola-cpcap: Document
 audio-codec interrupts
Message-ID: <34ratvyiosxtphzliv6jxcjsddk4op5745jummklumd7fyzoe4@lq4ylmrlokmr>
References: <20241228114514.91594-1-ivo.g.dimitrov.75@gmail.com>
 <20241228114514.91594-4-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241228114514.91594-4-ivo.g.dimitrov.75@gmail.com>

On Sat, Dec 28, 2024 at 01:45:12PM +0200, Ivaylo Dimitrov wrote:
> This adds the DT binding for the audio-codec headset detection interrupts


Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

Also, missing full stop.

> 
> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/motorola-cpcap.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt b/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
> index 190230216de8..3ad809e119ff 100644
> --- a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
> +++ b/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
> @@ -31,10 +31,15 @@ node must be named "audio-codec".
>  Required properties for the audio-codec subnode:
>  
>  - #sound-dai-cells = <1>;
> +- interrupts-extended = <&cpcap 9 0>, <&cpcap 10 0>;

Instead: interrupts and say which interrupt is where.

Anyway this should be converted to DT schema.

> +- interrupt-names = "hs", "mb2";
>  
>  The audio-codec provides two DAIs. The first one is connected to the
>  Stereo HiFi DAC and the second one is connected to the Voice DAC.
>  
> +audio-codec interrupts are required for jack detection, "hs" one is headset
> +detect and "mb2" is microphone bias 2 detect.

This goes to the interrupts description.

> +
>  Example:
>  
>  &mcspi1 {
> @@ -52,6 +57,10 @@ Example:
>  
>  		audio-codec {
>  			#sound-dai-cells = <1>;
> +			interrupts-extended =
> +				<&cpcap 9 0>,
> +				<&cpcap 10 0>;

Fix alignment.

Same for your DTS patches.


Best regards,
Krzysztof


