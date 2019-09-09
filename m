Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34E8EADD58
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2019 18:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728121AbfIIQfs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Sep 2019 12:35:48 -0400
Received: from muru.com ([72.249.23.125]:60412 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727764AbfIIQfs (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 9 Sep 2019 12:35:48 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1DEAB80BF;
        Mon,  9 Sep 2019 16:36:17 +0000 (UTC)
Date:   Mon, 9 Sep 2019 09:35:43 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc:     Adam Ford <aford173@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <adam.ford@logicpd.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Paul Walmsley <paul@pwsan.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC] ARM: omap3: Enable HWMODS for HW Random Number Generator
Message-ID: <20190909163543.GQ52127@atomide.com>
References: <20190828150037.2640-1-aford173@gmail.com>
 <20190905230443.GA52127@atomide.com>
 <CAHCN7xL0fbr=Sv+b=0AuGB1PPhAAFdAFLEd_iBM+ZMTkUw5sHQ@mail.gmail.com>
 <CAHCN7xL-Gfxe0qF5w7BUsHnyhcNNpmCnchdKErnmiqggXfsLWw@mail.gmail.com>
 <20190909134033.s26eiurpat3iekse@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190909134033.s26eiurpat3iekse@pali>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pali Rohár <pali.rohar@gmail.com> [190909 13:41]:
> On Monday 09 September 2019 08:37:09 Adam Ford wrote:
> > I applied this on 5.3 and it is working.  I assume the same is true in for-next.

Hmm I noticed I stopped getting RNG data after several rmmod modprobe
cycles, or several hd /dev/random reads. Anybody else seeing that?

> > Do you want to submit a formal patch?  I  can mark it as 'tested-by'
> > This really helps speed up the startup sequence on boards with sshd
> > because it delays for nearly 80 seconds waiting for entropy without
> > the hwrng.
> 
> Hi! When applying a patch, could you please disable this rng for n900?
> 
> In omap3-n900.dts for rng should be status = "disabled" (as Tony already
> wrote), similarly like for aes.

Yeah I'll post a proper patch after -rc1.

Regards,

Tony
