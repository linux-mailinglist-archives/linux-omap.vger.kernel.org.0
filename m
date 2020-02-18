Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83FEE1624E7
	for <lists+linux-omap@lfdr.de>; Tue, 18 Feb 2020 11:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgBRKsP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 Feb 2020 05:48:15 -0500
Received: from eddie.linux-mips.org ([148.251.95.138]:47514 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbgBRKsP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 18 Feb 2020 05:48:15 -0500
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
        (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
        id S23991105AbgBRKsLlRzGF (ORCPT <rfc822;linux-omap@vger.kernel.org>
        + 1 other); Tue, 18 Feb 2020 11:48:11 +0100
Date:   Tue, 18 Feb 2020 11:48:10 +0100
From:   Ladislav Michl <ladis@linux-mips.org>
To:     Chanwoo Choi <cw00.choi@samsung.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org
Subject: Re: [PATCH v3] extcon: palmas: hide error messages if gpio returns
 -EPROBE_DEFER
Message-ID: <20200218104810.GA194120@lenoch>
References: <CGME20200217133832epcas1p329af393e88fa76189ca141d2534f9ad2@epcas1p3.samsung.com>
 <d5c2826a5f00fcaee62f00662ae2a44dc4a5395d.1581946695.git.hns@goldelico.com>
 <b2655a58-6541-a2c9-c44d-536e5cef1ee3@samsung.com>
 <20200218102140.GA193069@lenoch>
 <cbee6f0b-f268-2e77-f7b7-f19114fdf178@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbee6f0b-f268-2e77-f7b7-f19114fdf178@samsung.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Feb 18, 2020 at 07:35:47PM +0900, Chanwoo Choi wrote:
> On 2/18/20 7:21 PM, Ladislav Michl wrote:
> > On Tue, Feb 18, 2020 at 12:28:25PM +0900, Chanwoo Choi wrote:
> >> On 2/17/20 10:38 PM, H. Nikolaus Schaller wrote:
> >>> If the gpios are probed after this driver (e.g. if they
> >>> come from an i2c expander) there is no need to print an
> >>> error message.
> >>>
> >>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> >>> ---
> >>>  drivers/extcon/extcon-palmas.c | 8 ++++++--
> >>>  1 file changed, 6 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/extcon/extcon-palmas.c b/drivers/extcon/extcon-palmas.c
> >>> index edc5016f46f1..cea58d0cb457 100644
> >>> --- a/drivers/extcon/extcon-palmas.c
> >>> +++ b/drivers/extcon/extcon-palmas.c
> >>> @@ -205,14 +205,18 @@ static int palmas_usb_probe(struct platform_device *pdev)
> >>>  
> >>>  	palmas_usb->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id",
> >>>  							GPIOD_IN);
> >>> -	if (IS_ERR(palmas_usb->id_gpiod)) {
> >>> +	if (PTR_ERR(palmas_usb->id_gpiod) == -EPROBE_DEFER) {
> >>> +		return -EPROBE_DEFER;

Here we returned...

> >>> +	} else if (IS_ERR(palmas_usb->id_gpiod)) {

How could this else get triggered?

> >>>  		dev_err(&pdev->dev, "failed to get id gpio\n");
> >>>  		return PTR_ERR(palmas_usb->id_gpiod);
> >>>  	}
> >>>  
> >>>  	palmas_usb->vbus_gpiod = devm_gpiod_get_optional(&pdev->dev, "vbus",
> >>>  							GPIOD_IN);
> >>> -	if (IS_ERR(palmas_usb->vbus_gpiod)) {
> >>> +	if (PTR_ERR(palmas_usb->vbus_gpiod) == -EPROBE_DEFER) {
> >>> +		return -EPROBE_DEFER;
> >>> +	} else if (IS_ERR(palmas_usb->vbus_gpiod)) {
> >>>  		dev_err(&pdev->dev, "failed to get vbus gpio\n");
> >>>  		return PTR_ERR(palmas_usb->vbus_gpiod);
> >>>  	}
> >>>
> >>
> >> I think that it is enough to handle the -EPROBE_DEFER.
> >> Also, I prefer to use single if/else statement 
> >> instead of the nested if/else statement.
> >>
> >> Applied it.
> > 
> > Uh... As it is? Then it is matter of time it triggers someones cocci
> > script pointing to else after return. Could you at least fix this?
> 
> Sorry. I don't understand. Do you mean that this patch has the
> some issue of cocci script?

Yes.

> I think that it fixes the probe sequence issue
> between extcon-palmas and gpio driver. It is not related to
> any result from cocci script. If the extcon-palmas.c has
> the issue by cocci or checkpatch, anyone can send the other patch
> for fixup.

Do you mean to send fixup to what you just applied? What happened
to review process? Nikolaus himself told you patch could be better
and we were just waiting which solution you choose to send final patch.

> I think that it is enough to fix the issue which is only
> related to the probe sequence between gpio and extcon-palmas.c

Agree, but look again at the patch.

	ladis
