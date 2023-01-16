Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D713166B795
	for <lists+linux-omap@lfdr.de>; Mon, 16 Jan 2023 07:43:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231648AbjAPGnQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Jan 2023 01:43:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231855AbjAPGnO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 Jan 2023 01:43:14 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BDE534495
        for <linux-omap@vger.kernel.org>; Sun, 15 Jan 2023 22:43:13 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B270C8108;
        Mon, 16 Jan 2023 06:43:12 +0000 (UTC)
Date:   Mon, 16 Jan 2023 08:43:11 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     "H. Nikolaus Schaller" <hns@messlink.de>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Subject: Re: omap_hsmmc RX DMA errors
Message-ID: <Y8Tx/49BYvLDNje6@atomide.com>
References: <CAHCN7xJT+1XP-LHyzj0GB5rDnVP+EgGmUVb6h4uTJA4bVE1yPg@mail.gmail.com>
 <5DD8AC17-A7FD-4D44-953E-F2EF84C6896D@messlink.de>
 <CAHCN7xJZgy1HKp-sHtqZeKAa2uKFtLLGeEguJoZRB+RswEfgJg@mail.gmail.com>
 <CAHCN7xLrDGMNKyXw6Eb9LJSHm_wDF2N3PjDKUtZ6LKTvQOxfFw@mail.gmail.com>
 <Y7us8Ann7tjJ5lcn@atomide.com>
 <CAHCN7x+EaXd3cR-0pUnjwDJAWqyb6Oamrh9HJyskpmLJfMobqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7x+EaXd3cR-0pUnjwDJAWqyb6Oamrh9HJyskpmLJfMobqw@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [230115 18:55]:
> On Sun, Jan 8, 2023 at 11:58 PM Tony Lindgren <tony@atomide.com> wrote:
> > Things should be ready to flip the remaining SoCs to use sdhci so we
> > should do that.
> 
> Do you want me to push a patch?  It might bring more clout if it comes
> from you, but I don't mind. If so, how do we handle the backwards
> compatibility stuff with older device trees?

Sure please go ahead and post a patch for omap3.dtsi. It's best to do it
one SoC type at a time. Older dtb files will work as long as there is
the old mmc driver in place. But considering we don't even have complete
data in the dts files in general, I would not worry about supporting older
dtb files. In most cases we can add boot timer warnings if needed.

Regards,

Tony
