Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53DC9C2267
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2019 15:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730759AbfI3NtD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Sep 2019 09:49:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:39956 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730693AbfI3NtD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 30 Sep 2019 09:49:03 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 551602086A;
        Mon, 30 Sep 2019 13:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569851342;
        bh=FCh5P+PLkf8Fy6u6DVHDWSyXy5Kb48cMb9OwoT818PQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nw3vrRnoJ/wyKkOghJGAhrfUjB4HUOGPzCULFD4Kr3iQLmw7IAL1yY1IbWzMPK4da
         eWbi6TE0ysvXKKMXYG8TK4x25jKiw/UAo+8HKTHiQZ8fv8/6pjbdMTDnYfvnQhdogc
         3egyNZeMKQN7sD0n38+1a4P88VMa2muNcfOChcBU=
Date:   Mon, 30 Sep 2019 14:48:57 +0100
From:   Will Deacon <will@kernel.org>
To:     Keerthy <j-keerthy@ti.com>
Cc:     arnd@arndb.de, nsekhar@ti.com, olof@lixom.net, t-kristo@ti.com,
        catalin.marinas@arm.com, tony@atomide.com, s-anna@ti.com,
        hch@lst.de, bjorn.andersson@linaro.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 linux-next 4/4] arm64: configs: defconfig: Change
 CONFIG_REMOTEPROC from m to y
Message-ID: <20190930134856.umdoeq7k6ukmajij@willie-the-truck>
References: <20190920075946.13282-1-j-keerthy@ti.com>
 <20190920075946.13282-5-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190920075946.13282-5-j-keerthy@ti.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Sep 20, 2019 at 01:29:46PM +0530, Keerthy wrote:
> Commit 6334150e9a36 ("remoteproc: don't allow modular build")
> changes CONFIG_REMOTEPROC to a boolean from a tristate config
> option which inhibits all defconfigs marking CONFIG_REMOTEPROC as
> a module in compiling the remoteproc and dependent config options.
> 
> So fix the defconfig to have CONFIG_REMOTEPROC built in.
> 
> Fixes: 6334150e9a36 ("remoteproc: don't allow modular build")
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> ---
>  arch/arm64/configs/defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 8e05c39eab08..c9a867ac32d4 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -723,7 +723,7 @@ CONFIG_TEGRA_IOMMU_SMMU=y
>  CONFIG_ARM_SMMU=y
>  CONFIG_ARM_SMMU_V3=y
>  CONFIG_QCOM_IOMMU=y
> -CONFIG_REMOTEPROC=m
> +CONFIG_REMOTEPROC=y
>  CONFIG_QCOM_Q6V5_MSS=m
>  CONFIG_QCOM_Q6V5_PAS=m
>  CONFIG_QCOM_SYSMON=m

Acked-by: Will Deacon <will@kernel.org>

This fixes the following annoying warning from "make defconfig" on arm64:

  arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid for REMOTEPROC

I'm assuming the fix will go via arm-soc, but I can take it otherwise
(please just let me know).

Will
