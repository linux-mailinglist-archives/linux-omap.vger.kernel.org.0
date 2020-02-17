Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F267F1619BB
	for <lists+linux-omap@lfdr.de>; Mon, 17 Feb 2020 19:29:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728958AbgBQS3M (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Feb 2020 13:29:12 -0500
Received: from eddie.linux-mips.org ([148.251.95.138]:56104 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727749AbgBQS3L (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Feb 2020 13:29:11 -0500
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
        (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
        id S23990923AbgBQS3JEK45R (ORCPT <rfc822;linux-omap@vger.kernel.org>
        + 1 other); Mon, 17 Feb 2020 19:29:09 +0100
Date:   Mon, 17 Feb 2020 19:29:06 +0100
From:   Ladislav Michl <ladis@linux-mips.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org
Subject: Re: [PATCH v3] extcon: palmas: hide error messages if gpio returns
 -EPROBE_DEFER
Message-ID: <20200217182906.GA140676@lenoch>
References: <d5c2826a5f00fcaee62f00662ae2a44dc4a5395d.1581946695.git.hns@goldelico.com>
 <C3D9F783-EE45-4681-93D9-C1407284CB59@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C3D9F783-EE45-4681-93D9-C1407284CB59@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Feb 17, 2020 at 02:58:14PM +0100, H. Nikolaus Schaller wrote:
> 
> > Am 17.02.2020 um 14:38 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> > 
> > If the gpios are probed after this driver (e.g. if they
> > come from an i2c expander) there is no need to print an
> > error message.
> > 
> > Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> > ---
> > drivers/extcon/extcon-palmas.c | 8 ++++++--
> > 1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/extcon/extcon-palmas.c b/drivers/extcon/extcon-palmas.c
> > index edc5016f46f1..cea58d0cb457 100644
> > --- a/drivers/extcon/extcon-palmas.c
> > +++ b/drivers/extcon/extcon-palmas.c
> > @@ -205,14 +205,18 @@ static int palmas_usb_probe(struct platform_device *pdev)
> > 
> > 	palmas_usb->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id",
> > 							GPIOD_IN);
> > -	if (IS_ERR(palmas_usb->id_gpiod)) {
> > +	if (PTR_ERR(palmas_usb->id_gpiod) == -EPROBE_DEFER) {
> > +		return -EPROBE_DEFER;
> > +	} else if (IS_ERR(palmas_usb->id_gpiod)) {
> 
> Hm.
> 
> While looking again at that: why do we need the "{" and "} else "?
> 
> It should be sufficient to have
> 
> > 	palmas_usb->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id",
> > 							GPIOD_IN);
> > +	if (PTR_ERR(palmas_usb->id_gpiod) == -EPROBE_DEFER)
> > +		return -EPROBE_DEFER;
> > 	if (IS_ERR(palmas_usb->id_gpiod)) {
> 
> What do you think is better coding style here?

How about something like this? (just an idea with some work left for you ;-))

--- a/drivers/extcon/extcon-palmas.c
+++ b/drivers/extcon/extcon-palmas.c
@@ -206,8 +206,10 @@ static int palmas_usb_probe(struct platform_device *pdev)
 	palmas_usb->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id",
 							GPIOD_IN);
 	if (IS_ERR(palmas_usb->id_gpiod)) {
-		dev_err(&pdev->dev, "failed to get id gpio\n");
-		return PTR_ERR(palmas_usb->id_gpiod);
+		status = PTR_ERR(palmas_usb->id_gpiod);
+		if (status != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "failed to get id gpio: %d\n", status);
+		return status;
 	}
 
 	palmas_usb->vbus_gpiod = devm_gpiod_get_optional(&pdev->dev, "vbus",
