Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19AFA473E4E
	for <lists+linux-omap@lfdr.de>; Tue, 14 Dec 2021 09:37:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231864AbhLNIhw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Dec 2021 03:37:52 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:45222 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231866AbhLNIhv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Dec 2021 03:37:51 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0D4B561361;
        Tue, 14 Dec 2021 08:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC031C34604;
        Tue, 14 Dec 2021 08:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639471070;
        bh=TvV/V0V16sdLEQl+HlEmCOlDtRLk5EBJCALVpvBZbhc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ml5Vs22Z4OWRXO4JeVTbeL2BgsHRQ/ty/zN2Ze+DxlXFVRg+y9COW5RarxmS+5Kg7
         wf0QBUnxKKB876gSFZoWXCVe68prPDZEzmSqUTvVYHI8PtDkmJjQMMFesM51+FMFA6
         t1OhlGH9S78dbnw7coqg/CUrw07wERauvj8PMQjOB3OjAo41a4df0TGMfP+wo3fmqS
         HjLMja3pqGYFfJfh4m7377kiG5RjyD4FS3c4LP9u0X5kiMpN1OkNTYkio0hVzGBs3T
         OZ5oAq7vpP4UpOwKqUcj3QnMOeiRXbASSeOTkI10x4cpbgUbTb1rYR1dMKOiGi9eET
         zVdKv1Sj9NFKQ==
Date:   Tue, 14 Dec 2021 16:37:44 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: Remove unsupported properties for STMPE MFD
Message-ID: <20211214083743.GH14056@dragon>
References: <20211209173009.618162-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211209173009.618162-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Dec 09, 2021 at 06:30:09PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Some users of the STMPE MFD bindings use unsupported properties such as
> "id", "blocks" and "irq-trigger". These look like they may have been
> under discussion at some point but never made it into the bindings that
> were accepted upstream.
> 
> Remove these unknown properties from the device trees to avoid errors
> during validation against the DT schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
...
>  arch/arm/boot/dts/imx53-m53.dtsi           | 3 ---
>  arch/arm/boot/dts/imx6q-novena.dts         | 3 ---
>  arch/arm/boot/dts/imx6qdl-apalis.dtsi      | 3 ---
>  arch/arm/boot/dts/imx6qdl-colibri.dtsi     | 3 ---

Acked-by: Shawn Guo <shawnguo@kernel.org>
