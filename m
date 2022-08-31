Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB5AD5A7C8E
	for <lists+linux-omap@lfdr.de>; Wed, 31 Aug 2022 13:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiHaLyo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 31 Aug 2022 07:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiHaLyn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 31 Aug 2022 07:54:43 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C7E56C7F9B
        for <linux-omap@vger.kernel.org>; Wed, 31 Aug 2022 04:54:42 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 08F9E80B5;
        Wed, 31 Aug 2022 11:47:18 +0000 (UTC)
Date:   Wed, 31 Aug 2022 14:54:40 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Nishanth Menon <nm@ti.com>, Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: Unable to boot 6.0-rc3 on dra76
Message-ID: <Yw9MAKJyZlonv9b3@atomide.com>
References: <abf4d275-b732-b1d5-35f0-40d78ef09962@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abf4d275-b732-b1d5-35f0-40d78ef09962@ideasonboard.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [220831 11:35]:
> Hi,
> 
> I've been unable to boot 6.0-rc3 on dra76 evm with omap2plus_defconfig. I get no output from the kernel.
> Enabling earlyprintk gives me the following. Any ideas?

This series of fixes for deferred probe in Linux next should help:

https://lore.kernel.org/linux-kernel/20220819221616.2107893-1-saravanak@google.com/

Hopefully it will get merged to the mainline kernel soonish.

Regards,

Tony
