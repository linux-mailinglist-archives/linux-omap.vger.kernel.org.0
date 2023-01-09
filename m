Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 130A0661E86
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jan 2023 06:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbjAIF6N (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Jan 2023 00:58:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbjAIF6M (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Jan 2023 00:58:12 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 81ADEDFFE
        for <linux-omap@vger.kernel.org>; Sun,  8 Jan 2023 21:58:10 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 80234804D;
        Mon,  9 Jan 2023 05:58:09 +0000 (UTC)
Date:   Mon, 9 Jan 2023 07:58:08 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     "H. Nikolaus Schaller" <hns@messlink.de>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Subject: Re: omap_hsmmc RX DMA errors
Message-ID: <Y7us8Ann7tjJ5lcn@atomide.com>
References: <CAHCN7xJT+1XP-LHyzj0GB5rDnVP+EgGmUVb6h4uTJA4bVE1yPg@mail.gmail.com>
 <5DD8AC17-A7FD-4D44-953E-F2EF84C6896D@messlink.de>
 <CAHCN7xJZgy1HKp-sHtqZeKAa2uKFtLLGeEguJoZRB+RswEfgJg@mail.gmail.com>
 <CAHCN7xLrDGMNKyXw6Eb9LJSHm_wDF2N3PjDKUtZ6LKTvQOxfFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xLrDGMNKyXw6Eb9LJSHm_wDF2N3PjDKUtZ6LKTvQOxfFw@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Adam Ford <aford173@gmail.com> [230105 19:20]:
> On Thu, Jan 5, 2023 at 1:08 PM Adam Ford <aford173@gmail.com> wrote:
> > On Thu, Jan 5, 2023 at 12:17 PM H. Nikolaus Schaller <hns@messlink.de> wrote:
> > > Am 05.01.2023 um 18:54 schrieb Adam Ford <aford173@gmail.com>:
> > >
> > > Would there be an objection if I migrate the OMAP3.dtsi file to the
> > > newer driver?  I wasn't sure if there was a reason this family was
> > > being held back from the newer driver.
> > >
> > >
> > > AFAIR Tony wanted to retire the older driver anyways.
> >
> > That was my impression and it appears that the AM35x has already
> 
> correction AM335x (not AM35x)
> 
> > migrated to it.  I wasn't sure what was holding us back.  In theory,
> > we could add the compatible flags to the new driver and mark them as
> > deprecated so the new driver would work with older device trees if
> > there was push-back on changing the device trees.  I know sometimes
> > there are concerns about using older device trees and the interaction
> > with the compatible flags make it a bit more complex.

Things should be ready to flip the remaining SoCs to use sdhci so we
should do that.

The only thing I'm aware of is that sdhci will try to keep probing
also mmc instances that are not wired. So some board specific dts files
may need to set some mmc instances with status = "disabled". Or maybe
the sdhci driver can be configured to stop trying after some timeout.

Regards,

Tony
