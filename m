Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24B035FABF0
	for <lists+linux-omap@lfdr.de>; Tue, 11 Oct 2022 07:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbiJKFjZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Oct 2022 01:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiJKFjZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Oct 2022 01:39:25 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 599437B1F7;
        Mon, 10 Oct 2022 22:39:24 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 87E8880FE;
        Tue, 11 Oct 2022 05:30:36 +0000 (UTC)
Date:   Tue, 11 Oct 2022 08:39:22 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Sicelo <absicsz@gmail.com>
Cc:     linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        maemo-leste@lists.dyne.org, Felipe Balbi <balbi@kernel.org>,
        phone-devel@vger.kernel.org, Bin Liu <b-liu@ti.com>,
        Rob Herring <robh@kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [maemo-leste] USB PHY Initialization Fails on Nokia N900 Since
 5.19
Message-ID: <Y0UBindrJa1ptyR0@atomide.com>
References: <Y0PhEOl+MwlQ8HAD@tp440p.steeds.sam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0PhEOl+MwlQ8HAD@tp440p.steeds.sam>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Adding Rob and HNS to Cc too for commit cf081d009c44 ("usb: musb: Set the
DT node on the child device").

* Sicelo <absicsz@gmail.com> [221010 09:00]:
> I have tried to bisect, but due to inexperience and lack of proper
> tooling (e.g. no serial console), I have not been able to pinpoint the
> cause of the error so far. However, on linux 6.0 with cf081d009c447647
> reverted, there is a more detailed trace in dmesg - the same trace
> appeared in other kernel versions while bisecting:

To me it seems that we now somehow have a probe issue for musb depending
on how it gets probed depending on the following line:

device_set_of_node_from_dev(&musb->dev, &pdev->dev);

I think commit 239071064732 ("partially Revert "usb: musb: Set the DT node
on the child device"") fixed the issue for omap3 that still uses hwmod
by removing the device_set_of_node_from_dev(). However, it somehow broke
SoCs using ti-sysc like omap4.

My guess is commit 239071064732 will fix the issue for you?

I'm not sure what the proper fix here might be to have both working
though :)

FYI, I have a pending patch set to convert omap3 also to probe with
ti-sysc for musb, but seems like there's some other issue here that
should be fixed first.

Regards,

Tony

