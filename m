Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D29A675AC1
	for <lists+linux-omap@lfdr.de>; Fri, 26 Jul 2019 00:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbfGYW2B (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Jul 2019 18:28:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:52040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726529AbfGYW2B (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 25 Jul 2019 18:28:01 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2780B22CB8;
        Thu, 25 Jul 2019 22:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564093680;
        bh=Gc4j7JsS0PjEqHwHozSF6rnexXcgZrxvTO7RzQKTFss=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qYKNAz5PezlzROpy2lFbbpWuvjBQQerqHVVoYdLK6BzcCi0YJ6s0CmlONb9/I5AM1
         L0RukfeT06fQaJbG70NYTYfsXjuSMxHagn/0dawapVGqL1qC4E8q3RTpjLGC6X5AIR
         5h+Mdi8oyGTVijokVjg31L8lkWnD/qVPI6sBY6eE=
Received: by mail-qt1-f176.google.com with SMTP id x22so45779511qtp.12;
        Thu, 25 Jul 2019 15:28:00 -0700 (PDT)
X-Gm-Message-State: APjAAAXqYVUI2aJTexDAlW+Z1VpN/PyxLQQCINZbf/NaJvi6oA9jX2GM
        A4IUgabZ8V1gBD85jEZTE6BPRwFULJuJwS8HyQ==
X-Google-Smtp-Source: APXvYqzMrba+PSzsy/UywtewDZNE2ndi2LwEvg/77++h8VlXxXyt+GJmdgq9yzgHsfF2c6MrwB/hdxHMg94hegJNNTo=
X-Received: by 2002:a0c:8a43:: with SMTP id 3mr66978138qvu.138.1564093679211;
 Thu, 25 Jul 2019 15:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190708035243.12170-1-s-anna@ti.com> <20190708035243.12170-2-s-anna@ti.com>
 <20190724163419.GA29254@bogus> <6871c381-9fc6-f6be-6386-f183fcc5546a@ti.com>
In-Reply-To: <6871c381-9fc6-f6be-6386-f183fcc5546a@ti.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 25 Jul 2019 16:27:48 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJz9eDOMPA=HbvZ3W_h5XMaW8uah7dq6k474MBnSmrq4Q@mail.gmail.com>
Message-ID: <CAL_JsqJz9eDOMPA=HbvZ3W_h5XMaW8uah7dq6k474MBnSmrq4Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: irqchip: Add PRUSS interrupt controller bindings
To:     Suman Anna <s-anna@ti.com>
Cc:     Marc Zyngier <marc.zyngier@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Tony Lindgren <tony@atomide.com>,
        "Andrew F. Davis" <afd@ti.com>, Roger Quadros <rogerq@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        David Lechner <david@lechnology.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        devicetree@vger.kernel.org,
        linux-omap <linux-omap@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Jul 24, 2019 at 1:42 PM Suman Anna <s-anna@ti.com> wrote:
>
> On 7/24/19 11:34 AM, Rob Herring wrote:
> > On Sun, 7 Jul 2019 22:52:38 -0500, Suman Anna wrote:
> >> The Programmable Real-Time Unit Subsystem (PRUSS) contains an interrupt
> >> controller (INTC) that can handle various system input events and post
> >> interrupts back to the device-level initiators. The INTC can support
> >> upto 64 input events on most SoCs with individual control configuration
> >> and hardware prioritization. These events are mapped onto 10 interrupt
> >> lines through two levels of many-to-one mapping support. Different
> >> interrupt lines are routed to the individual PRU cores or to the
> >> host CPU or to other PRUSS instances.
> >>
> >> The K3 AM65x and J721E SoCs have the next generation of the PRU-ICSS IP,
> >> commonly called ICSSG. The ICSSG interrupt controller on K3 SoCs provide
> >> a higher number of host interrupts (20 vs 10) and can handle an increased
> >> number of input events (160 vs 64) from various SoC interrupt sources.
> >>
> >> Add the bindings document for these interrupt controllers on all the
> >> applicable SoCs. It covers the OMAP architecture SoCs - AM33xx, AM437x
> >> and AM57xx; the Keystone 2 architecture based 66AK2G SoC; the Davinci
> >> architecture based OMAPL138 SoCs, and the K3 architecture based AM65x
> >> and J721E SoCs.
> >>
> >> Signed-off-by: Suman Anna <s-anna@ti.com>
> >> Signed-off-by: Andrew F. Davis <afd@ti.com>
> >> Signed-off-by: Roger Quadros <rogerq@ti.com>
> >> ---
> >> Prior version: https://patchwork.kernel.org/patch/10795771/
> >>
> >>  .../interrupt-controller/ti,pruss-intc.txt    | 92 +++++++++++++++++++
> >>  1 file changed, 92 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.txt
> >>
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> >
>
> Thanks Rob. I am going to submit a v2 with some minor reword changes
> based on couple of comments, but no addition or removal of properties.
> Should I be retaining your Reviewed-by for v2?

Yes.
