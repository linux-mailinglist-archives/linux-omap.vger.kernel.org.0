Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A50015CD6B
	for <lists+linux-omap@lfdr.de>; Thu, 13 Feb 2020 22:44:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbgBMVok (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 13 Feb 2020 16:44:40 -0500
Received: from muru.com ([72.249.23.125]:55136 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726282AbgBMVoj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 13 Feb 2020 16:44:39 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CBE60804F;
        Thu, 13 Feb 2020 21:45:22 +0000 (UTC)
Date:   Thu, 13 Feb 2020 13:44:35 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc:     Merlijn Wajer <merlijn@wizzup.org>,
        "Arthur D." <spinal.by@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: Nokia N900 on 5.4 and 5.5
Message-ID: <20200213214435.GW64767@atomide.com>
References: <79b91017-b52a-8aff-4b9c-913ae655f7bf@wizzup.org>
 <185CD173-C13C-4D56-B3DE-9A8D7784963C@goldelico.com>
 <20200207163623.GA64767@atomide.com>
 <da14d6bb-f241-2dd4-8e94-886217a40ed7@wizzup.org>
 <20200207165344.GB64767@atomide.com>
 <20200207170149.GC64767@atomide.com>
 <op.0fmv4jevhxa7s4@supervisor.net28>
 <8a19bde5-f49f-ad58-3b3b-6df8a764f1f2@wizzup.org>
 <CAKv+Gu8Yh2Y5Rg6rVtL5zsm1CJhgRKjug3NW4j_uuuO+YhMzRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKv+Gu8Yh2Y5Rg6rVtL5zsm1CJhgRKjug3NW4j_uuuO+YhMzRA@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Ard Biesheuvel <ard.biesheuvel@linaro.org> [200213 21:34]:
> Is there any way you can enable early serial output one one of these
> boards, to see if you are making it through the decompressor all the
> way into the kernel?

I was able to reproduce this on another board with appended dtb,
looks like uncompress happens fine but then nothing. Looking at
System.map the u-boot alignment warning Merlijn posted, pc is
somewhere very early in the kernel.

I can easily reproduce the issue now if you have something in mind
to try.

Regards,

Tony
