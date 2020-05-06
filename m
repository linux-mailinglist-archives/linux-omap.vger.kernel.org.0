Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CAE91C6BB8
	for <lists+linux-omap@lfdr.de>; Wed,  6 May 2020 10:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728349AbgEFI3z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 May 2020 04:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbgEFI3z (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 6 May 2020 04:29:55 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02FCAC061A0F;
        Wed,  6 May 2020 01:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=29yPD5EFQvWHiHRl9ixtK8NqYFRN0nj9nyx44Gn2F6A=; b=GK1EIA4dcKqihYlhdzf6JvGRy
        Ch5mS4j2OJuV0sfm8wEN6/Cwtzrd7mWqgeQ3AmAKLDDexw37wgf49Yiwf6KEC2OelEltRWo0Z8pC1
        LtunA41h0FyF9h1/GxReHi+x8AFWR5zW3mWNkJOUq4ugWJpg4NMLGrzbt6Cl1Ix7A1zJdyxLbj5/E
        06HPc+b1Cek7F1UIDmClH9b8ZXTKDjHVOweRigSQ6CSGgAi5DeLo9P4qSH5imOiWTY+B1F25KfCiP
        m+FMwU30gfosFffDJAMS8nHjeZV8mCkTAoHUTnngv96oDAFjXI12Mz5cNuRYMQVd1W32w8w9xNK/6
        5CTiaHl1A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56826)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jWFR2-0007VQ-7l; Wed, 06 May 2020 09:29:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jWFQz-00081B-N0; Wed, 06 May 2020 09:29:41 +0100
Date:   Wed, 6 May 2020 09:29:41 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Jason Yan <yanaijie@huawei.com>
Cc:     tony@atomide.com, peter.ujfalusi@ti.com,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP2+: remove unneeded variable "errata" in
 configure_dma_errata()
Message-ID: <20200506082941.GA1559@shell.armlinux.org.uk>
References: <20200506061900.19832-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506061900.19832-1-yanaijie@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, May 06, 2020 at 02:19:00PM +0800, Jason Yan wrote:
> Fix the following coccicheck warning:
> 
> arch/arm/mach-omap2/dma.c:82:10-16: Unneeded variable: "errata". Return
> "0" on line 161

NAK.  Look closer at what the code is doing, thanks.

This warning is basically incorrect.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up
