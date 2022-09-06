Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 470CE5AE085
	for <lists+linux-omap@lfdr.de>; Tue,  6 Sep 2022 09:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233075AbiIFHGJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Sep 2022 03:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232746AbiIFHGI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 6 Sep 2022 03:06:08 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E6B715A2D5;
        Tue,  6 Sep 2022 00:06:04 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 99C3A80E1;
        Tue,  6 Sep 2022 06:58:28 +0000 (UTC)
Date:   Tue, 6 Sep 2022 10:06:02 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Roger Quadros <rogerq@kernel.org>
Cc:     Romain Naour <romain.naour@smile.fr>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, bcousson@baylibre.com,
        Romain Naour <romain.naour@skf.com>
Subject: Re: [PATCHv2] ARM: dts: am5748: keep usb4_tm disabled
Message-ID: <YxbxWnIcfTszKxTH@atomide.com>
References: <20220823072742.351368-1-romain.naour@smile.fr>
 <d986aee3-9fd4-4f3b-f742-725833a70338@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d986aee3-9fd4-4f3b-f742-725833a70338@kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Roger Quadros <rogerq@kernel.org> [220825 07:01]:
> On 23/08/2022 10:27, Romain Naour wrote:
> > From: Romain Naour <romain.naour@skf.com>
> > 
> > Commit bcbb63b80284 ("ARM: dts: dra7: Separate AM57 dtsi files")
> > disabled usb4_tm for am5748 devices since USB4 IP is not present
> > in this SoC.
> > 
> > The commit log explained the difference between AM5 and DRA7 families:
> > 
> > AM5 and DRA7 SoC families have different set of modules in them so the
> > SoC sepecific dtsi files need to be separated.
> > 
> > e.g. Some of the major differences between AM576 and DRA76
> > 
> > 		DRA76x	AM576x
> > 
> > USB3		x
> > USB4		x
> > ATL		x
> > VCP		x
> > MLB		x
> > ISS		x
> > PRU-ICSS1		x
> > PRU-ICSS2		x
> > 
> > Then commit 176f26bcd41a ("ARM: dts: Add support for dra762 abz
> > package") removed usb4_tm part from am5748.dtsi and introcuded new
> > ti-sysc errors in dmesg:
> > 
> > ti-sysc 48940000.target-module: clock get error for fck: -2
> > ti-sysc: probe of 48940000.target-module failed with error -2
> > 
> > Fixes: 176f26bcd41a ("ARM: dts: Add support for dra762 abz package")
> > 
> > Signed-off-by: Romain Naour <romain.naour@skf.com>
> > Signed-off-by: Romain Naour <romain.naour@smile.fr>
> > Cc: Roger Quadros <rogerq@kernel.org>
> > ---
> > Issue reproduced on a AM5749 CPU using a 5.10 kernel from ti-linux-kernel:
> > https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=linux-5.10.y
> > 
> > v2: improved commit log to ease patch backport
> > ---
> >  arch/arm/boot/dts/am5748.dtsi | 4 ++++
> >  1 file changed, 4 insertions(+)
> 
> Reviewed-by: Roger Quadros <rogerq@kernel.org>

Applying into fixes thanks.

Tony
