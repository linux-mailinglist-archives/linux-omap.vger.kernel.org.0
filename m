Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D22F228602
	for <lists+linux-omap@lfdr.de>; Thu, 23 May 2019 20:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731575AbfEWSg3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 May 2019 14:36:29 -0400
Received: from emh02.mail.saunalahti.fi ([62.142.5.108]:59472 "EHLO
        emh02.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731383AbfEWSg3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 May 2019 14:36:29 -0400
Received: from darkstar.musicnaut.iki.fi (85-76-4-80-nat.elisa-mobile.fi [85.76.4.80])
        by emh02.mail.saunalahti.fi (Postfix) with ESMTP id F02B220060;
        Thu, 23 May 2019 21:36:23 +0300 (EEST)
Date:   Thu, 23 May 2019 21:36:23 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc:     Thomas Huth <thuth@redhat.com>,
        Corentin Labbe <clabbe.montjoie@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        qemu-devel@nongnu.org, linux-kernel@vger.kernel.org,
        Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-devel] Running linux on qemu omap
Message-ID: <20190523183623.GB5234@darkstar.musicnaut.iki.fi>
References: <20190520190533.GA28160@Red>
 <20190521232323.GD3621@darkstar.musicnaut.iki.fi>
 <20190522093341.GA32154@Red>
 <20190522181904.GE3621@darkstar.musicnaut.iki.fi>
 <8977e2bb-8d9e-f4fd-4c44-b4f67e0e7314@redhat.com>
 <c2972889-fe60-7614-fb6e-e57ddf780a54@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c2972889-fe60-7614-fb6e-e57ddf780a54@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Thu, May 23, 2019 at 02:00:41PM +0200, Philippe Mathieu-Daudé wrote:
> On 5/23/19 1:27 PM, Thomas Huth wrote:
> > On 22/05/2019 20.19, Aaro Koskinen wrote:
> >> On Wed, May 22, 2019 at 11:33:41AM +0200, Corentin Labbe wrote:
> >>> qemu-system-arm -M help |grep OMAP
> >>> cheetah              Palm Tungsten|E aka. Cheetah PDA (OMAP310)
> >>> n800                 Nokia N800 tablet aka. RX-34 (OMAP2420)
> >>> n810                 Nokia N810 tablet aka. RX-44 (OMAP2420)
> >>> sx1                  Siemens SX1 (OMAP310) V2
> >>> sx1-v1               Siemens SX1 (OMAP310) V1
> >>>
> >>>>> The maximum I can get with omap1_defconfig is
> >>>>> qemu-system-arm -kernel zImage -nographic -machine cheetah -append 'root=/dev/ram0 console=ttyO0'
> >>>>> Uncompressing Linux... done, booting the kernel.
> >>>>> then nothing more.
> >>
> >> With N800/N810 omap2plus_defconfig should be used instead. However,
> >> I don't think that works either (but haven't tried recently). Also with
> >> N800/N810 you need to append the DTB file to the kernel image.
> > 
> > FWIW, Philippe recently posted a mail how to run older kernels on n810:
> > 
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg610653.html

So it seems the issue with N8x0 is that serial console does not work.
And we are missing the display support in the mainline kernel.

> However I can see than none of the board listed by Corentin are tested
> ... That reminder me I never succeed at using the Cheetah PDA. So the
> OMAP310 is probably bitroting in QEMU...

Cheetah works with serial console. I tried with console on display,
and it seems to boot up, and the frame buffer window gets correctly
sized but for some reason it just stays blank.

A.
