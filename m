Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E62585AFBA0
	for <lists+linux-omap@lfdr.de>; Wed,  7 Sep 2022 07:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbiIGFRB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Sep 2022 01:17:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiIGFRA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Sep 2022 01:17:00 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3DC8479EDF;
        Tue,  6 Sep 2022 22:16:59 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id AF95780E1;
        Wed,  7 Sep 2022 05:09:20 +0000 (UTC)
Date:   Wed, 7 Sep 2022 08:16:56 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Roger Quadros <rogerq@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: am335x-baltos: change nand-xfer-type
Message-ID: <YxgpSKn3gVj47Zbr@atomide.com>
References: <20220705122355.14854-1-yegorslists@googlemail.com>
 <c12d9017-41bf-ce13-b0f9-93c608c8c67c@kernel.org>
 <CAGm1_kuswhND7fc0TnZgGH7Cp328OmCu+J40fdJyQd61AdnfhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGm1_kuswhND7fc0TnZgGH7Cp328OmCu+J40fdJyQd61AdnfhA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Yegor Yefremov <yegorslists@googlemail.com> [220711 04:30]:
> Hi Roger,
> 
> On Sun, Jul 10, 2022 at 8:54 AM Roger Quadros <rogerq@kernel.org> wrote:
> >
> > Hi Yegor,
> >
> > On 05/07/2022 17:53, yegorslists@googlemail.com wrote:
> > > From: Yegor Yefremov <yegorslists@googlemail.com>
> > >
> > > Use "prefetch-dma" instead of "polled".
> > Does using "polled" still cause the issue while Erasing NAND?
> 
> Yes, it does.

OK I'm applying this into omap-for-v6.1/dt then.

Regards,

Tony
