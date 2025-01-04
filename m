Return-Path: <linux-omap+bounces-2983-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A400A01652
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 19:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F3BE163088
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 18:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A761D515A;
	Sat,  4 Jan 2025 18:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhfKJAeY"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51FA1D0E36;
	Sat,  4 Jan 2025 18:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736015307; cv=none; b=EUX1w/5dCDjHXNSGRw+zHb9SrdbwahCOcXEBYFage36rseCvyuRtzEv1HLiMCsh2e0h1HMH3MZVlyX9espp7EiPmrbk/UI1IkpPYTGBgwe4UxobEHaWO8mdzMH8IlkGVZhaggHPJubsDrJn65kn7ZhDmdswM0quDgJG0qm/QoBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736015307; c=relaxed/simple;
	bh=bnQtjgjcXihxa9NPB+PZW+R6Wg31Ew/O3Xdqpjs8GfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iP4kE84RFV18bhZEctZS+36JzNwoXYnAOZjx/FmobXWAiVQISwPOuFfO/x6i60FeiMN3pcyOcd0a9imImU2J+5hFLgyJGvlpTXnSOMjCMqeSVjX5LbFWdL2gLad4X9cAnJBgV0lQL3ofAKQLDuEMe1ELUr6KJVnlJSL4rUzACg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YhfKJAeY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F861C4CED1;
	Sat,  4 Jan 2025 18:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736015306;
	bh=bnQtjgjcXihxa9NPB+PZW+R6Wg31Ew/O3Xdqpjs8GfY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YhfKJAeYrRNoyMQMN9hw1pjH1qW0QHuTFtfHY6CpcqEEiPDXJhS3fdy3hw+B8Aqsa
	 mpPjCj8nXL97EGUDr6JWmJoyn9aIu7+QBXj4hi1ODCau609KDi29vmCm3gHWpEuErc
	 LD1oRCfxUIESX6ksDcjIZkFS+lk3fn7TMvM4ihBzOrzD2d0E3/u2lPzwSSgubzNoK9
	 lBWsbBYe1wo7BHkvF2iatMj+u8JRqhkP/McVlH5FRYeyJnCduFmU1qZ6M0ZQUwC10T
	 TIhRmdYStCzO531pj93CRxwRigua+QF8IHdMV9XpOQ5RKF0wwlgwBFFgfhqUn8MGQK
	 3PPlaxwgh3dWA==
Message-ID: <918d3b67-9bb3-4da2-a779-69ae9e9c4f6b@kernel.org>
Date: Sat, 4 Jan 2025 20:28:19 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] regulator: dt-bindings: Add TI TPS65215 PMIC
 bindings
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, aaro.koskinen@iki.fi, andreas@kemnade.info,
 khilman@baylibre.com, tony@atomide.com, jerome.neanne@baylibre.com,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: m-leonard@ti.com, praneeth@ti.com
References: <20241226215412.395822-1-s-ramamoorthy@ti.com>
 <20241226215412.395822-2-s-ramamoorthy@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241226215412.395822-2-s-ramamoorthy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 26/12/2024 23:54, Shree Ramamoorthy wrote:
> TPS65215 is a Power Management IC with 3 Buck regulators and 2 LDOs.
> 
> TPS65215 has 2 LDOS and 1 GPO, whereas TPS65219 has 4 LDOs and 2 GPOs. The
> remaining features for both devices are the same.
> 
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
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
> +
>  properties:
>    compatible:
>      enum:
>        - ti,tps65219
> +      - ti,tps65215

Could be sorted alphanumerically.

>  
>    reg:
>      maxItems: 1

-- 
cheers,
-roger


