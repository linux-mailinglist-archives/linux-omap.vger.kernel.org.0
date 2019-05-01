Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30CF810E65
	for <lists+linux-omap@lfdr.de>; Wed,  1 May 2019 23:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfEAVN6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 May 2019 17:13:58 -0400
Received: from Galois.linutronix.de ([146.0.238.70]:52346 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbfEAVN5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 1 May 2019 17:13:57 -0400
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
        (envelope-from <bigeasy@linutronix.de>)
        id 1hLwXw-0000mK-CK; Wed, 01 May 2019 23:13:44 +0200
Date:   Wed, 1 May 2019 23:13:44 +0200
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Tony Lindgren <tony@atomide.com>
Cc:     "kernelci.org bot" <bot@kernelci.org>, Tejun Heo <tj@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        tomeu.vizoso@collabora.com, guillaume.tucker@collabora.com,
        mgalka@collabora.com, Thomas Gleixner <tglx@linutronix.de>,
        broonie@kernel.org, matthew.hart@linaro.org, khilman@baylibre.com,
        enric.balletbo@collabora.com, Ingo Molnar <mingo@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Kevin Hilman <khilman@kernel.org>, linux-omap@vger.kernel.org
Subject: Re: next/master boot bisection: next-20190430 on beagle-xm
Message-ID: <20190501211344.v5n7bmb2p5kksa47@linutronix.de>
References: <5cc8b55c.1c69fb81.c3759.1c27@mx.google.com>
 <20190501153711.pxmapo2k3n5ynqrc@linutronix.de>
 <20190501162944.GW8004@atomide.com>
 <20190501164444.iclxlzrxofqnj4bn@linutronix.de>
 <20190501165224.GK8007@atomide.com>
 <20190501170125.xjlwdyqtp5oxx2mb@linutronix.de>
 <20190501174431.GL8007@atomide.com>
 <20190501190303.pz2yxs3hnc2qpamu@linutronix.de>
 <20190501202149.GM8007@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190501202149.GM8007@atomide.com>
User-Agent: NeoMutt/20180716
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2019-05-01 13:21:49 [-0700], Tony Lindgren wrote:
> Hi,
Hi,

> OK I found two issues. It seems that d_can also needs osc clock
> on am335x. And there's no revision register for d_can.. We're now
> reading the CTL register unnecessarily.
> 
> Below is what I hope fixes the boot issue for you, care to boot
> test?

yup, that boots.
Thanks.

> If this helps I'll send out proper patches for for both issues.
> 
> Regards,
> 
> Tony

Sebastian
