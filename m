Return-Path: <linux-omap+bounces-4797-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D87C0F4CD
	for <lists+linux-omap@lfdr.de>; Mon, 27 Oct 2025 17:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF169425F4A
	for <lists+linux-omap@lfdr.de>; Mon, 27 Oct 2025 16:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F0530F92F;
	Mon, 27 Oct 2025 16:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KW0emSHj"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A30305943;
	Mon, 27 Oct 2025 16:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761582043; cv=none; b=dE0PYLTfrK8lDCHGTH3YTqHxkdOc2E/CHe7mTFsh1CON+vuU2rgACao3Wxqi9UX6yOn2B97i+191+pkYETKSd97hWJ71gczrxI8hZC/KVAtolmmwWIRGb31IndA1MccgMqt9tPLSuyzriiU8zlqTeV30ezUvZ4GNor7hlm2MiTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761582043; c=relaxed/simple;
	bh=kOpw6qzLvyna2HVqEwd3WCVScozkzFK3cyPFp55af4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OERFgk6P+R+/OUVicxFz0bJe0TkI6x5BVldrV1dvdyT31+TmcN635gqOwPEDsXCovQ4Nw/6E6qTlJeFA4hBgf2Jk8TNbu315O5slSfZw/wLNG32bSuXuzWcXP4j+0gsqwl6zydGz4oUYumDYFbTSfNfHhfvGnsVJdjN7JmSoK94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KW0emSHj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A7ABC4CEF1;
	Mon, 27 Oct 2025 16:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761582042;
	bh=kOpw6qzLvyna2HVqEwd3WCVScozkzFK3cyPFp55af4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KW0emSHjS9QbUlP9Nt1zJ+1ULgQPRSoY0euDScxoSOoOrLskpLi9m4mt5FMqZYDwO
	 kjPFQoNL3J99RenAj7msB46devSS+wSwygkmYigLu+Dp495AtJhJMVxZh4zm41FYSV
	 tpB9kPkFwLXldp91fi5fQtnhSTfTBAtj0i8+D2a1tAMoD4h/sySYEi9gNKPwQIak5n
	 fT5imdUfDt8CPa1bQkHwTt3xqCJvley6jwU6zq9O7cHRsTtvdZmG0JBy87i8FnBd+/
	 go+6YNBv0jqmy9P64PGlakXPAlUb5rFn2EwBhCIyyaJSFS3gNZn9IL/baJ00d3E4co
	 aJagPrZ3QQBGA==
Date: Mon, 27 Oct 2025 11:20:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-mmc@vger.kernel.org, Marc Murphy <marc.murphy@sancloud.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Paul Barker <paul.barker@sancloud.com>, linux-omap@vger.kernel.org
Subject: Re: [PATCH v5 3/3] dt-bindings: mmc: ti,omap2430-sdhci: convert to
 DT schema
Message-ID: <176158203862.994360.6947793531218943723.robh@kernel.org>
References: <20251024-ti-sdhci-omap-v5-0-df5f6f033a38@gmail.com>
 <20251024-ti-sdhci-omap-v5-3-df5f6f033a38@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-ti-sdhci-omap-v5-3-df5f6f033a38@gmail.com>


On Fri, 24 Oct 2025 07:57:10 +0000, Charan Pedumuru wrote:
> Convert TI OMAP SDHCI Controller binding to YAML format.
> Changes during Conversion:
> - Define new properties like "clocks", "clock-names",
>   "pbias-supply" and "power-domains" to resolve dtb_check errors.
> - Remove "pinctrl-names" and "pinctrl-<n>"
>   from required as they are not necessary for all DTS files.
> - Remove "ti,hwmods" property entirely from the YAML as the
>   DTS doesn't contain this property for the given compatibles and the
>   text binding is misleading.
> - Add "clocks", "clock-names" and "max-frequency" to the required
>   properties based on the compatible and the text binding doesn't mention
>   these properties as required.
> - Add missing strings like "default-rev11", "sdr12-rev11", "sdr25-rev11",
>   "hs-rev11", "sdr25-rev11" and "sleep" to pinctrl-names string array
>   to resolve errors detected by dtb_check.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  .../devicetree/bindings/mmc/sdhci-omap.txt         |  43 ------
>  .../devicetree/bindings/mmc/ti,omap2430-sdhci.yaml | 169 +++++++++++++++++++++
>  2 files changed, 169 insertions(+), 43 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


