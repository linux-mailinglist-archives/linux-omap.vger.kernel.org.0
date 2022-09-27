Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70D875EBAD4
	for <lists+linux-omap@lfdr.de>; Tue, 27 Sep 2022 08:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbiI0Gkx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Sep 2022 02:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbiI0Gkw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Sep 2022 02:40:52 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 92E0880489
        for <linux-omap@vger.kernel.org>; Mon, 26 Sep 2022 23:40:51 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7692780A6;
        Tue, 27 Sep 2022 06:32:32 +0000 (UTC)
Date:   Tue, 27 Sep 2022 09:40:49 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Romain Naour <romain.naour@smile.fr>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        "rogerq@kernel.org >> Roger Quadros" <rogerq@kernel.org>,
        Md Danish Anwar <danishanwar@ti.com>
Subject: Re: prueth: IEP driver doesn't probe anymore
Message-ID: <YzKa8csiFaJik79O@atomide.com>
References: <9aced000-5e66-50b9-1e1b-28ff96871d42@smile.fr>
 <28dc112e-94ce-ca21-2e35-97074f251b97@smile.fr>
 <edf56bca-3f90-5cac-7c21-085f4a563dac@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edf56bca-3f90-5cac-7c21-085f4a563dac@smile.fr>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Romain Naour <romain.naour@smile.fr> [220921 08:13]:
> Ok, I understand what's going on...
> 
> The issue appear on the merge commit since on a omap side there was the switch
> to ti-sysc (devicetree interconnect description) and on upstream side there was
> a change on driver core behavior with fw_devlink=on being set by default:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=ea718c699055c8566eb64432388a04974c43b2ea

OK good to hear it's not the change to ti-sysc. That should be all pretty
much standard Linux driver related changes.

> Actually the issue is really on the TI's prueth and IEP driver whith
> fw_devlink=on. The IEP driver probe correctly with fw_devlink=permissive.

Argh not again, the fw_devlink changes seem to be causing all kind of
issues. Any ideas what the issue here might be? It might be worth testing
with v6.0-rc7 too as it has a series of fixes to related issues.

Regards,

Tony
