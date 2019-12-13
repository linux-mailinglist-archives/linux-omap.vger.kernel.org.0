Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 056B711E235
	for <lists+linux-omap@lfdr.de>; Fri, 13 Dec 2019 11:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbfLMKl4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Dec 2019 05:41:56 -0500
Received: from mout.gmx.net ([212.227.15.19]:57295 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725890AbfLMKlz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 13 Dec 2019 05:41:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1576233714;
        bh=5ZkY1A/YEADPZaAHJi1eVCV+0m720qUQnVOg5aYU1nc=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=atZPR5bLRo+y6fzg2oSibjg9WnnE/AqaQGU8JPIpu3iVqHh5Ry37giVJ/xS6H21m+
         pjLJb6ZU5/RLV/C5FURbo67bwkxEtz56dlmuRJWn2f33djAX2pEAi6E4a4k201xXXG
         rWDr7vtxQ12MrsOlFu2EQ42VR31JCQzcjv6BF1iI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.150.99.66] ([80.150.99.66]) by web-mail.gmx.net
 (3c-app-gmx-bs17.server.lan [172.19.170.69]) (via HTTP); Fri, 13 Dec 2019
 11:41:54 +0100
MIME-Version: 1.0
Message-ID: <trinity-8c439dd8-69cc-4bbc-812f-a063b15a9369-1576233714035@3c-app-gmx-bs17>
From:   deffo@gmx.de
To:     linux-omap@vger.kernel.org, aford173@gmail.com
Cc:     tony@atomide.com
Subject: Re: twl: not initialized and twl6030_uv_to_vsel problems
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 13 Dec 2019 11:41:54 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:y7dt3no9y0n1IcE4+jBrsYMyYemOAxZYRClYGFhnUSABBivdnztoP8KAGOHg+vs5eFkYa
 0nyDVskbRgkD8QTOqmSsF4mo1d7EoJtg7MA0lgYV7Q0WRRzxl37cdFscVm8UYVe2ztZw2F1kwTe/
 l+X272PR6lxUEep+racB7byZ0SY7XoowTjub1XD99abSsDiy0OCCJ9KxnG5DZKms+ZWsAXnTyrh4
 zCR06KYuLnxGYxgwD8rPUkWjFw6RXb0qg3f3hSyYyDmuAje16rstMr+WAQ2rXw7fEyehkxY7oKan
 ss=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Qs2kd+/0oQM=:ncqz3zaemGvsvrPwKZrtOo
 QA+YnUkbPqaryVAKY0vVsqY8RkjWjYp6adIYcXrkLagMN4tragNFjhkAxahPYo45BPfJ73PiZ
 58b2BRJpdY8T+yS6NiiHlz2mEjYSJjpMmZJLqLGqNMSqGdy3e9f2G5/uyFbGarPJSQqX9taHC
 v2o0wgeaGtAMdSyPTz2ldgVqxmdlwtg3GL89Ba5q+zmdEsFe+eVaBIlGVDg1A85PfI9SejZLp
 GNahsRjXq2CIao735lDW07LHek8FHPvYUD7GLLYhS1mNrUio7DmcRsLePchAqyQI3LLthIGh4
 +jWNtDx+AZGFHvwXyaKabxBhfmOAbwdfrsKLBajlLjTt1IOMNYqvxJsi614RI58cwhv5xE4c3
 /1uNiygd/y4QMmBXaTDlInhV+mCcj3q4OMu4yn9O2DolwBNSmEtJdQMWPyumlv6BQe6MVDUQR
 WbkMuZ7R/tkICTj7e2SMrskHiYNB8CBlbG1WZQ0+cqR93rpB9myGnIx2ng68ZAe34AdaD0yqF
 RgbBKyi2wBBfnXREJS8Ns8ajtoqd/YCFEOc5uB/YUYTyVcUTu19YfRs4qH+4H+TQHOED0trlc
 MjRH1reBCsleXuRiO1G4QPO125U+PD7l1znw9DSy60b/1SC9t34Ef69uLHlzBCopzcjk1VgQc
 UUP7eZEsCCUVQMmTjIKlAd7Jiu+9wWiGZnKM7zfoellBCEQ==
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Thanks for the link Adam, I fixed this on my local branch.

Concerning the

[    2.318054] twl: not initialized

error, this is due to the fact, that the twl itself is probed later:

[    3.042114] twl_probe() called

So it cannot be available at this point. Might be a fundamental problem in=
 the chronological order of init calls?

On Wed, Nov 27, 2019 at 10:19 AM Tony Lindgren <tony@atomide.com> wrote:
>
> Hi,
>
> * deffo@gmx.de <deffo@gmx.de> [191127 13:53]:
> > hi there!
> >
> > i'm using the TI OMAP4460 (VAR-SOM-OM44) and i get several errors in d=
mesg on the latest for-next branch:
> >
> > root@localhost:~# dmesg -l err
> > [    1.146026] twl: not initialized
> > [    1.146087] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 13=
75000 Vs max 1316660
> > [    1.146087] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 13=
75000 Vs max 1316660
> > [    1.146179] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 13=
75000 Vs max 1316660
> > [    1.146209] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 13=
75000 Vs max 1316660
> > [    1.146270] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 13=
75000 Vs max 1316660
> > [    1.146301] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 13=
75000 Vs max 1316660
> > [    1.146331] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 14=
10000 Vs max 1316660
> > [    1.522979] omap_dm_timer_set_source: timer_sys_ck not found
>
> Sounds like something needs fixing for sure. Similar messages seem to
> appear for all omap4 with twl PMIC.

Something similar happened to the twl4030 on omap3.  Check out the fix
for it:   https://patchwork.kernel.org/patch/11094653/

It't not exactly the same, but It might be useful in fixing the twl6030.

adam

>
> > which probably leads to the problem, that the cpu cannot run with more=
 than 920 mhz. is this a known problem?
>
> Yes, see the drivers/cpufreq changes recently done for omap3:
>
> $ git log v5.4..3fbeef397212046cc514fe9fcd07e67e6ca32163 drivers/cpufreq
>
> Similar changes are also needed for omap4 to detect the supported rates.
>
> And then we also need to add a regulator controller driver for cpufreq
> to use that manages the voltage controller.
>
> > i need to run the cpus with 1.5 ghz, as it was possible with the v3.4 =
kernel, how is this possible?
>
> My guess is that v3.4 was missing some critical checks to protect
> the SoC :) But please do check, maybe we're missing some code that
> was there earlier.
>
> Regards,
>
> Tony
