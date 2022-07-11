Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED2BA56FF9F
	for <lists+linux-omap@lfdr.de>; Mon, 11 Jul 2022 13:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiGKLBP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Jul 2022 07:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbiGKLBA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 11 Jul 2022 07:01:00 -0400
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C37D4B9D97
        for <linux-omap@vger.kernel.org>; Mon, 11 Jul 2022 03:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1657533936;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=jm3y9Kft/NAhzSqkrL0ZwCbK7AJeFsLGl5vdNzBN+zE=;
    b=cwNlTRgFTRs3TjeutF1Y9w2tLSi8iiI5EEpDv7awE6JCQ1etb2VZZdeINJXBmEwdOI
    58bf+Ozw22yFPAItA1sZaT0tiICXiwbtDmB+0lrHtb39vaGiyFHqsIy2VFBQQTNbbrmK
    V9/ZZUwPIUhSXI/EI9zOULReB2s7ng8HkE0fCVANlTkRKQjKfRY7lDbPJ2taMGj2ySkp
    RJbXezByWkyqrBHEtZYssH9rRy8wYVFq32Gsa6wjsK4c3+M9re+BDMnbQti8HjRSjJ85
    X/9YfSw39xDF/YOo1dPAha0tiSljR5iRHYSZGao1zuNbBmvWotauSwhkdARRh3minUG+
    8LWw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGfqmU="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.46.1 DYNA|AUTH)
    with ESMTPSA id x1817fy6BA5aq6V
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Mon, 11 Jul 2022 12:05:36 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: Pandora audio using machine_is_omap3_pandora() check
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <e0c913bb-1dee-a089-00cb-0c81a53603e4@gmx.de>
Date:   Mon, 11 Jul 2022 12:05:35 +0200
Cc:     Tony Lindgren <tony@atomide.com>,
        Grazvydas Ignotas <notasas@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        alsa-devel@alsa-project.org,
        linux-omap <linux-omap@vger.kernel.org>,
        Grond <grond66@riseup.net>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <466F8216-E9A0-4FCE-838D-43A5322C15C1@goldelico.com>
References: <Yrl92RILZwhQOP+e@atomide.com>
 <B6EFBA88-2311-4455-82CB-3E5382C92B4E@goldelico.com>
 <Yrm2dl9EtIb5IYhi@atomide.com> <e0c913bb-1dee-a089-00cb-0c81a53603e4@gmx.de>
To:     Stefan Leichter <sle85276@gmx.de>
X-Mailer: Apple Mail (2.3445.104.21)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,


> Am 05.07.2022 um 23:39 schrieb Stefan Leichter <sle85276@gmx.de>:
>=20
> Hi,
>=20
> Am 27.06.22 um 15:53 schrieb Tony Lindgren:
>> * H. Nikolaus Schaller <hns@goldelico.com> [220627 11:36]:
>>> Hi Tony,
>>>=20
>>>> Am 27.06.2022 um 11:52 schrieb Tony Lindgren <tony@atomide.com>:
>>>>=20
>>>> Hi Grazvydas,
>>>>=20
>>>> Arnd noticed that pandora audio is using machine_is_omap3_pandora() =
check
>>>> that never succeeds for devicetree booting machines. Looks like =
this has
>>>> been broken at some point many years ago with the devicetree =
conversion.
>>>>=20
>>>> Does anybody have an interest in fixing this driver?
>>>=20
>>> we already have fixes by Stefan Leichter and Grond here (incl. =
removing any call to machine_is_omap3_pandora):
>>>=20
>>> 	=
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dshortlog;h=3Drefs/head=
s/letux/sound-soc
>>=20
>> OK :)
>>=20
>>> But I don't know who can volunteer to run this series through the =
upstreaming discussions
>>> and do regression tests (AFAIR the Pandora of Grond is broken and he =
has no replacement).
>=20
> I hope that Grond's Pandora didn't break because of experiments to get =
the sound working.

We tried to analyse but it is unilekely. It may just be wear somewhere =
else.
I also see XUDF error reports from I2C from time to time and it seems to =
depend a little on battery charge.
Difficult to pinpoint.

>=20
>>=20
>> Probably best that Stefan and Grond do it :) Not sure what the =
minimal fix
>> for the mainline kernel might be to get things at least try to probe.
>>=20
>=20
> Well, I think I'm not the right person to try to mainline the patches, =
but if nobody else like to volunteer I will give it a try. Be warned, I =
have no experience with mainlining patches, even not with kernel =
programming at all. Therefore I need someone holding my hand. Does =
anybody volunteer?

Yes, we all :)

Basically the task is to
a) shape (i.e. rebase, edit) the patches according the rules: =
https://www.kernel.org/doc/html/latest/process/submitting-patches.html
b) add Signed-Offs etc.
c) compile test
d) git format-patch
e) ./scripts/checkpatch.pl and fix any reported weaknesses
f) send by mail to this audience (perhaps check with ./MAINTAINERS)

>=20
> I had a look to the branch Nikolaus pointed out. Here are some =
questions about the patches in the branch:
>=20
> - It seams to me the branch doesn't support any longer to compile the =
driver directly into the kernel. Am I correct?

Hm. It still should? What makes you think so?

> - There are three patches from Andreas and Nikolaus in the beginning =
of the branch. Are this patched needed to be mainlined too?

No, they are not related to the Pandora but its cousin the GTA04.

> - Two of my patches are super seeded by the patches from Grond. My =
guess it that the patches needs to be squashed together?

Yes.

> - Where should I send the patches? The current audience might be a =
little bit large?

The audience is usually defined by ./MAINTAINERS
And whoever could contribute in review.

BR and thanks,
Nikolaus


