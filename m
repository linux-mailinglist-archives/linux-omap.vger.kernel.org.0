Return-Path: <linux-omap+bounces-2970-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B04A013DE
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 11:13:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DA803A41B2
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 10:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B93418DF93;
	Sat,  4 Jan 2025 10:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ztyd25ED"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27A14409;
	Sat,  4 Jan 2025 10:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735985597; cv=none; b=LASlrnPig5+642rPNmjc051iI95Np7WuqBbiQptEJoVX88y3sCHq0XEMP1y8UmtIAxAq9P824YbZFd3VvIL+fX9oDv5ta3L6QLJVo+qEWOR6ZJWalz10pMEHBsRGopSp6glTxoFOK8qlpjat3UPiTKNO1+pKjxRodTaLzA3spPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735985597; c=relaxed/simple;
	bh=Ni7PwVtfaPGy5YPIPyRtXMh49JoCOqIsKvhdCkpdwDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZiDqTngNMpa1IvA64vKmP6VXdrL7kEDE0RNR25feycIc4IOiOnfpUaWWpoXwCa1wBPssL4Ab49bzzJKUEBju5lheQ7VuikC3zxteA7OUxWBkCm6Be2mWsCgB35sU3aEz8sr1nOf6DA3T4bzccBUkGA8V/gS6JDQ+oFfn7gU2W+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ztyd25ED; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3EEC4CED1;
	Sat,  4 Jan 2025 10:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735985596;
	bh=Ni7PwVtfaPGy5YPIPyRtXMh49JoCOqIsKvhdCkpdwDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ztyd25EDvMNlpYh4pVgvLN9Xhvbg8GFK1Di2hr14y07X9HQhKh/Ok+zR6cv1pYQ5a
	 jjP2n6q4FO6d+N7zBeQSkhMEII/A0Wd841LRpB0KLR+8PCQQdndXw241zTzm0FQLSs
	 VveRF0M9xNbZ+2oFsAW5DKVFmLPReIQXyKouYHQ+H+qMEgL4WvBnksAVsXAmAeUjb6
	 xhUA3nRBXpmPewxo9NDBnLD1VWWw0uiqN56Uh9e9t7KoleBhErN8hkCqgM95Xzo7vE
	 2SwqVZgzuxrwiFWlzfsBGr6DJqC7uAu0ONnlFn1SgqeqlwbxTC+8fM+/ZTaIHxbq4y
	 GjbbjlU9Iqlww==
Date: Sat, 4 Jan 2025 11:13:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, aaro.koskinen@iki.fi, andreas@kemnade.info, 
	khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com, jerome.neanne@baylibre.com, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	m-leonard@ti.com, praneeth@ti.com, christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH v2 1/7] regulator: dt-bindings: Add TI TPS65215 PMIC
 bindings
Message-ID: <f7wlc35b3tdonu3k34v64evnh3zypfpb42t7ixumkwjminw53r@odkwfpuru6e6>
References: <20250103230446.197597-1-s-ramamoorthy@ti.com>
 <20250103230446.197597-2-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250103230446.197597-2-s-ramamoorthy@ti.com>

On Fri, Jan 03, 2025 at 05:04:40PM -0600, Shree Ramamoorthy wrote:
> TPS65215 is a Power Management IC with 3 Buck regulators and 2 LDOs.
> 
> TPS65215 has 2 LDOS and 1 GPO, whereas TPS65219 has 4 LDOs and 2 GPOs. The
> remaining features for both devices are the same.
> 
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/regulator/ti,tps65219.yaml       | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml b/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
> index 78e64521d401..ba5f6fcf5219 100644
> --- a/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
> +++ b/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/regulator/ti,tps65219.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: TI tps65219 Power Management Integrated Circuit regulators
> +title: TI TPS65215/TPS65219 Power Management Integrated Circuit
>  
>  maintainers:
>    - Jerome Neanne <jerome.neanne@baylibre.com>
> @@ -12,10 +12,17 @@ maintainers:
>  description: |
>    Regulator nodes should be named to buck<number> and ldo<number>.
>  
> +  TI TPS65219 is a Power Management IC with 3 Buck regulators, 4 Low
> +  Drop-out Regulators (LDOs), 1 GPIO, 2 GPOs, and power-button.
> +
> +  TI TPS65215 is a derivative of TPS65219 with 3 Buck regulators, 2 Low
> +  Drop-out Regulators (LDOs), 1 GPIO, 1 GPO, and power-button.

Then you need allOf:if:then: which will disallow :false two LDOs and
their supplies.

> +
>  properties:
>    compatible:
>      enum:
>        - ti,tps65219
> +      - ti,tps65215

Keep things ordered, don't add whatever you add to the end of the lists.

Best regards,
Krzysztof


