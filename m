Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED86E169F49
	for <lists+linux-omap@lfdr.de>; Mon, 24 Feb 2020 08:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbgBXHbO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 02:31:14 -0500
Received: from eddie.linux-mips.org ([148.251.95.138]:52176 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725792AbgBXHbO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 02:31:14 -0500
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
        (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
        id S23990678AbgBXHbLbR4t8 (ORCPT <rfc822;linux-omap@vger.kernel.org>
        + 1 other); Mon, 24 Feb 2020 08:31:11 +0100
Date:   Mon, 24 Feb 2020 08:31:10 +0100
From:   Ladislav Michl <ladis@linux-mips.org>
To:     Chanwoo Choi <cw00.choi@samsung.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org
Subject: Re: [PATCH v3] extcon: palmas: hide error messages if gpio returns
 -EPROBE_DEFER
Message-ID: <20200224073110.GA58786@lenoch>
References: <CGME20200217133832epcas1p329af393e88fa76189ca141d2534f9ad2@epcas1p3.samsung.com>
 <d5c2826a5f00fcaee62f00662ae2a44dc4a5395d.1581946695.git.hns@goldelico.com>
 <b2655a58-6541-a2c9-c44d-536e5cef1ee3@samsung.com>
 <20200218102140.GA193069@lenoch>
 <cbee6f0b-f268-2e77-f7b7-f19114fdf178@samsung.com>
 <20200218104810.GA194120@lenoch>
 <34f3cd11-321b-9aab-31a7-a3fb03691980@samsung.com>
 <20200221074740.GA44103@lenoch>
 <1cf484d9-572c-ea19-49d6-cd4cf61c9965@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cf484d9-572c-ea19-49d6-cd4cf61c9965@samsung.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Feb 24, 2020 at 11:12:08AM +0900, Chanwoo Choi wrote:
> On 2/21/20 4:47 PM, Ladislav Michl wrote:
> > On Tue, Feb 18, 2020 at 08:09:16PM +0900, Chanwoo Choi wrote:
> >> On 2/18/20 7:48 PM, Ladislav Michl wrote:
> >>> On Tue, Feb 18, 2020 at 07:35:47PM +0900, Chanwoo Choi wrote:
> >>>> On 2/18/20 7:21 PM, Ladislav Michl wrote:
> >>>>> On Tue, Feb 18, 2020 at 12:28:25PM +0900, Chanwoo Choi wrote:
> >>>>>> On 2/17/20 10:38 PM, H. Nikolaus Schaller wrote:
> >>>>>>> If the gpios are probed after this driver (e.g. if they
> >>>>>>> come from an i2c expander) there is no need to print an
> >>>>>>> error message.
> >>>>>>>
> >>>>>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> >>>>>>> ---
> >>>>>>>  drivers/extcon/extcon-palmas.c | 8 ++++++--
> >>>>>>>  1 file changed, 6 insertions(+), 2 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/extcon/extcon-palmas.c b/drivers/extcon/extcon-palmas.c
> >>>>>>> index edc5016f46f1..cea58d0cb457 100644
> >>>>>>> --- a/drivers/extcon/extcon-palmas.c
> >>>>>>> +++ b/drivers/extcon/extcon-palmas.c
> >>>>>>> @@ -205,14 +205,18 @@ static int palmas_usb_probe(struct platform_device *pdev)
> >>>>>>>  
> >>>>>>>  	palmas_usb->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id",
> >>>>>>>  							GPIOD_IN);
> >>>>>>> -	if (IS_ERR(palmas_usb->id_gpiod)) {
> >>>>>>> +	if (PTR_ERR(palmas_usb->id_gpiod) == -EPROBE_DEFER) {
> >>>>>>> +		return -EPROBE_DEFER;
> >>>
> >>> Here we returned...
> >>
> >> hmm. you better to suggest the result of cocci script
> >> to understand why it is matter.
> > 
> > You can browse similar fixes online :)
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/?qt=grep&q=else+after+return
> > 
> 
> As you commented, please share the result
> of cocci or checkpatch warning. It is simple to finish
> this discussion. 

What is happening here? Do we really need tools to see the obvious?
See for example commit 09971adc33b ("staging: iio: addac: Remove unnecessary
else after return"). Running script mentioned in above commit with
"[PATCH v3] extcon: palmas: hide error messages if gpio returns"
applied gives:
~/src/linux$ spatch -sp_file s.cocci -in_place drivers/extcon/extcon-palmas.c
init_defs_builtins: /usr/lib/coccinelle/standard.h
HANDLING: drivers/extcon/extcon-palmas.c
diff = 
--- drivers/extcon/extcon-palmas.c
+++ /tmp/cocci-output-67907-55371b-extcon-palmas.c
@@ -207,7 +207,7 @@ static int palmas_usb_probe(struct platf
 							GPIOD_IN);
 	if (PTR_ERR(palmas_usb->id_gpiod) == -EPROBE_DEFER) {
 		return -EPROBE_DEFER;
-	} else if (IS_ERR(palmas_usb->id_gpiod)) {
+	} if (IS_ERR(palmas_usb->id_gpiod)) {
 		dev_err(&pdev->dev, "failed to get id gpio\n");
 		return PTR_ERR(palmas_usb->id_gpiod);
 	}
@@ -216,7 +216,7 @@ static int palmas_usb_probe(struct platf
 							GPIOD_IN);
 	if (PTR_ERR(palmas_usb->vbus_gpiod) == -EPROBE_DEFER) {
 		return -EPROBE_DEFER;
-	} else if (IS_ERR(palmas_usb->vbus_gpiod)) {
+	} if (IS_ERR(palmas_usb->vbus_gpiod)) {
 		dev_err(&pdev->dev, "failed to get vbus gpio\n");
 		return PTR_ERR(palmas_usb->vbus_gpiod);
 	}

That's why I wrote previously: "Then it is matter of time it triggers
someones cocci script pointing to else after return."
Linux git history proves there are people running such a scripts
and results of such a scripts gets applied.

I do not care too much, you are the one adding more work for
yourself ;-)

	ladis
