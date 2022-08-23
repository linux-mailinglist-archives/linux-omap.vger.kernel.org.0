Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBA9459D0BC
	for <lists+linux-omap@lfdr.de>; Tue, 23 Aug 2022 07:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240293AbiHWFxf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Aug 2022 01:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240300AbiHWFxe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 Aug 2022 01:53:34 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 153DC1055E;
        Mon, 22 Aug 2022 22:53:26 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4E81580F9;
        Tue, 23 Aug 2022 05:46:19 +0000 (UTC)
Date:   Tue, 23 Aug 2022 08:53:24 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Romain Naour <romain.naour@smile.fr>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        bcousson@baylibre.com, Romain Naour <romain.naour@skf.com>,
        Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH] ARM: dts: am5748: keep usb4_tm disabled
Message-ID: <YwRrVI0asWtyyorZ@atomide.com>
References: <20220822154625.52160-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220822154625.52160-1-romain.naour@smile.fr>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Romain Naour <romain.naour@smile.fr> [220822 15:39]:
> From: Romain Naour <romain.naour@skf.com>
> 
> From [1]
> AM5 and DRA7 SoC families have different set of modules in them so the
> SoC sepecific dtsi files need to be separated.
> 
> e.g. Some of the major differences between AM576 and DRA76
> 
> 		DRA76x	AM576x
> 
> USB3		x
> USB4		x
> ATL		x
> VCP		x
> MLB		x
> ISS		x
> PRU-ICSS1		x
> PRU-ICSS2		x
> 
> But commit [2] removed usb4_tm part from am5748.dtsi and introcuded new
> ti-sysc errors in dmesg.

OK makes sense to me. Can you please update your patch to use proper
Fixes tags and commit descriptions? This way the patch will get
automatically picked up for stable kernels as a fix.

So something like this instead of listing URLs to commits:

Commit bcbb63b80284 ("ARM: dts: dra7: Separate AM57 dtsi files") blah
blah, then commit 176f26bcd41a ("ARM: dts: Add support for dra762 abz
package") blah blah...

Fixes: 176f26bcd41a ("ARM: dts: Add support for dra762 abz package")

Regards,

Tony
