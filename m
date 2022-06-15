Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E15F54C38C
	for <lists+linux-omap@lfdr.de>; Wed, 15 Jun 2022 10:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245205AbiFOIbp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Jun 2022 04:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245207AbiFOIbN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 15 Jun 2022 04:31:13 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DE5AB49CB7
        for <linux-omap@vger.kernel.org>; Wed, 15 Jun 2022 01:31:09 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id ED38880FE;
        Wed, 15 Jun 2022 08:26:23 +0000 (UTC)
Date:   Wed, 15 Jun 2022 11:31:08 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: am335x: GPIOs in userspace
Message-ID: <YqmYzFkO7NgRbbfp@atomide.com>
References: <CAGm1_ku2O3Z7OegxKpq4SnaycvzmgFR7SO1PoZJ3h4P7OHvQYg@mail.gmail.com>
 <CAPgEAj7wNtgf9sUrL1E14LgrPwiLv=bGcAyhdzns3ZnkH-Qqww@mail.gmail.com>
 <CAGm1_ksRcRBG+Ns+XJ4YvXyZmnMPXLqBiurhqkphSRR8orZbaw@mail.gmail.com>
 <CAGm1_kscjH-hQA+K6OcVJUiwCOrrfgjW5PHRw=Zdci788h9j1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGm1_kscjH-hQA+K6OcVJUiwCOrrfgjW5PHRw=Zdci788h9j1A@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Yegor Yefremov <yegorslists@googlemail.com> [220614 12:32]:
> I found the problem. Between 5.10 and 5.11 gpiochip assignment has
> changed: gpiochip1 -> gpiochip4. Hence, I'll have to work with gpio
> labels.

OK good to hear you found the problem.

Tony
