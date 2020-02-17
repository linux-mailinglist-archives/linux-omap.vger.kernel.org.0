Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA73B161B39
	for <lists+linux-omap@lfdr.de>; Mon, 17 Feb 2020 20:07:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729242AbgBQTHv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Feb 2020 14:07:51 -0500
Received: from eddie.linux-mips.org ([148.251.95.138]:57570 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728054AbgBQTHv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Feb 2020 14:07:51 -0500
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
        (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
        id S23990923AbgBQTHr3cfaD (ORCPT <rfc822;linux-omap@vger.kernel.org>
        + 1 other); Mon, 17 Feb 2020 20:07:47 +0100
Date:   Mon, 17 Feb 2020 20:07:45 +0100
From:   Ladislav Michl <ladis@linux-mips.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org
Subject: Re: [PATCH v3] extcon: palmas: hide error messages if gpio returns
 -EPROBE_DEFER
Message-ID: <20200217190745.GA147152@lenoch>
References: <d5c2826a5f00fcaee62f00662ae2a44dc4a5395d.1581946695.git.hns@goldelico.com>
 <C3D9F783-EE45-4681-93D9-C1407284CB59@goldelico.com>
 <20200217182906.GA140676@lenoch>
 <012228CC-2B49-4AAE-B574-92E44621F0D6@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <012228CC-2B49-4AAE-B574-92E44621F0D6@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Feb 17, 2020 at 07:38:16PM +0100, H. Nikolaus Schaller wrote:
> Hi,
> 
> > Am 17.02.2020 um 19:29 schrieb Ladislav Michl <ladis@linux-mips.org>:
> > 
> > On Mon, Feb 17, 2020 at 02:58:14PM +0100, H. Nikolaus Schaller wrote:
> >> 
> >>> Am 17.02.2020 um 14:38 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> >>> 
> >>> If the gpios are probed after this driver (e.g. if they
> >>> come from an i2c expander) there is no need to print an
> >>> error message.
> >>> 
> >>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> >>> ---
> >>> drivers/extcon/extcon-palmas.c | 8 ++++++--
> >>> 1 file changed, 6 insertions(+), 2 deletions(-)
> >>> 
> >>> diff --git a/drivers/extcon/extcon-palmas.c b/drivers/extcon/extcon-palmas.c
> >>> index edc5016f46f1..cea58d0cb457 100644
> >>> --- a/drivers/extcon/extcon-palmas.c
> >>> +++ b/drivers/extcon/extcon-palmas.c
> >>> @@ -205,14 +205,18 @@ static int palmas_usb_probe(struct platform_device *pdev)
> >>> 
> >>> 	palmas_usb->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id",
> >>> 							GPIOD_IN);
> >>> -	if (IS_ERR(palmas_usb->id_gpiod)) {
> >>> +	if (PTR_ERR(palmas_usb->id_gpiod) == -EPROBE_DEFER) {
> >>> +		return -EPROBE_DEFER;
> >>> +	} else if (IS_ERR(palmas_usb->id_gpiod)) {
> >> 
> >> Hm.
> >> 
> >> While looking again at that: why do we need the "{" and "} else "?
> >> 
> >> It should be sufficient to have
> >> 
> >>> 	palmas_usb->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id",
> >>> 							GPIOD_IN);
> >>> +	if (PTR_ERR(palmas_usb->id_gpiod) == -EPROBE_DEFER)
> >>> +		return -EPROBE_DEFER;
> >>> 	if (IS_ERR(palmas_usb->id_gpiod)) {
> >> 
> >> What do you think is better coding style here?
> > 
> > How about something like this? (just an idea with some work left for you ;-))
> > 
> > --- a/drivers/extcon/extcon-palmas.c
> > +++ b/drivers/extcon/extcon-palmas.c
> > @@ -206,8 +206,10 @@ static int palmas_usb_probe(struct platform_device *pdev)
> > 	palmas_usb->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id",
> > 							GPIOD_IN);
> > 	if (IS_ERR(palmas_usb->id_gpiod)) {
> > -		dev_err(&pdev->dev, "failed to get id gpio\n");
> > -		return PTR_ERR(palmas_usb->id_gpiod);
> > +		status = PTR_ERR(palmas_usb->id_gpiod);
> > +		if (status != -EPROBE_DEFER)
> > +			dev_err(&pdev->dev, "failed to get id gpio: %d\n", status);
> > +		return status;
> > 	}
> 
> Well, what would be the improvement?

Linux kernel prints so many lines on bootup and only few of them are
valuable. Lets improve it by printing error value to give a clue
why it failed.

> It needs an additional variable and makes the change more complex.

That additional variable is already there...

> The main suggestion by Chanwoo Choi was to move the check for EPROBE_DEFER
> outside of the IS_ERR() because checking this first and then for EPROBE_DEFER
> is not necessary.

True, but there are two checks either way and this is slow path.

> If acceptable I'd prefer my last proposal. It just adds 2 LOC before
> and without touching the existing if (IS_ERR(...)).

I have no strong opinion. I was just waiting for project to compile
so, consider my reply as product of boredom :)
(However, I do not like "let's touch only minimal number of lines"
argument. End result should still matter more)

> If the compiler is clever it can cache palmas_usb->id_gpiod in a register
> which serves the same purpose as the status variable.

I'm not trying to outsmart compiler, but note status variable is needed
three times.

> > 
> > 	palmas_usb->vbus_gpiod = devm_gpiod_get_optional(&pdev->dev, "vbus",
> 
> BR and thanks,
> Nikolaus
