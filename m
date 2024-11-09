Return-Path: <linux-omap+bounces-2643-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A969C2BDF
	for <lists+linux-omap@lfdr.de>; Sat,  9 Nov 2024 11:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5379A1C20F12
	for <lists+linux-omap@lfdr.de>; Sat,  9 Nov 2024 10:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3170152166;
	Sat,  9 Nov 2024 10:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uk3lXw5J"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1D4233D73;
	Sat,  9 Nov 2024 10:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731148501; cv=none; b=OnqJe6fm7tJJ6/QLdVu21shLrl98xVMxmo/S+/cyRZfQDZUPcPO7S2XKjbKnECnPix0I4Kb43eQa6lSwXEo5LoQmKtLiyYcUq23zQni/c1+Qq/LqPRz7RfCyqwXMq1fQDfq0o0K27xSLlrlFCh4a2dAEB/lbWeFCGE9e2LkbMuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731148501; c=relaxed/simple;
	bh=nq6mooPKeU7DUSC5ySOB0ohGQFdAzM2NupJ0qrZLsH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QDJl6+9ObsG6FODtKAsyKfiH+X33PLpEg4THWUFsI+LLtC65xz2drWnv7KoghyNNxaIEVF14Iv9+bwcxhN+JxrOMXsodNxN0S11ydmDU1B/snP7Y90+NJ5vRU6WPWxjNFt1DnrsSrff5hbPxfXTvW1v6uc05y746oKAI16tLCmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uk3lXw5J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6FCC4CECE;
	Sat,  9 Nov 2024 10:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731148501;
	bh=nq6mooPKeU7DUSC5ySOB0ohGQFdAzM2NupJ0qrZLsH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uk3lXw5JdeGdvzCD3+P5FvUxcuPrLiFLYYYYTUN/3zTpA/u0QOSj86KWb5RoQYwAv
	 +ytIP31Fzr+I7dRuh4uy8tEGkLWj59n+xj9zpsLfAotuNfW9daWQDb5/PmA1tKgbPe
	 Gpoh7+2d7u+rgKVPB9UgrDDMpIF9JICohaECDtNjgnFzA1pf7xtQ0CIfEhErJLXVhs
	 TMOdufcOBaxOXLTWjm5Q2bhO1Jtf0XHJnnuTPwD0TtzQlz7pflY2fSDSSZ1s8Td70l
	 B1WUtWunm1O1DvK4+J3zMveL5M3INqcyugnkJSWYYgu+Z5zkdYQoR9Tez4MIVPKxfV
	 qA/gzyWBTwiCg==
Date: Sat, 9 Nov 2024 11:34:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Thierry Reding <thierry.reding@gmail.com>, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 07/10] dt-bindings: omap: Add Samsung Galaxy Tab 2 7.0
Message-ID: <duiiumt2ma3g5qbdwedyehtfm45lovjhslmy6idf3xkqroipmv@qpimirp4aptd>
References: <20241108200440.7562-1-bavishimithil@gmail.com>
 <20241108200440.7562-8-bavishimithil@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241108200440.7562-8-bavishimithil@gmail.com>

On Fri, Nov 08, 2024 at 08:04:36PM +0000, Mithil Bavishi wrote:
> Add samsung-espresso7 codename for the 7 inch variant
> 
> Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/ti/omap.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> index 93e04a109..32978dd9e 100644
> --- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> @@ -138,6 +138,7 @@ properties:
>                - motorola,xyboard-mz617
>                - ti,omap4-panda
>                - ti,omap4-sdp
> +              - samsung,espresso7

Keep alphabetical order

Best regards,
Krzysztof


