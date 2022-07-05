Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39B6256796F
	for <lists+linux-omap@lfdr.de>; Tue,  5 Jul 2022 23:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbiGEVkW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Jul 2022 17:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbiGEVkV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Jul 2022 17:40:21 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE5D4186F6
        for <linux-omap@vger.kernel.org>; Tue,  5 Jul 2022 14:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1657057200;
        bh=1Ly2+eCPZ9fsX5aY8FIBrA8xKjgoGLGeSBmsNjkyGoo=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=fS4jpFH7ulxsa3X3vrQaJBRUQtcA4L/0ipzM+BoGDbcfqBtTzPyAKyTg/zowsmM5j
         9VcIFy4RK7efUXzIQQ0BjQXCZbkaIhSTH6PvCL6sf1b2zcd2h+9z23MSPWj7OQxj9Y
         fIF23Jqa1Yf91YvQtGdPDM+iND18tgYMhPd3yLzs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.180.20] ([178.27.64.98]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeCpb-1nZDwG3RHL-00bI6s; Tue, 05
 Jul 2022 23:39:59 +0200
Message-ID: <e0c913bb-1dee-a089-00cb-0c81a53603e4@gmx.de>
Date:   Tue, 5 Jul 2022 23:39:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Pandora audio using machine_is_omap3_pandora() check
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Grazvydas Ignotas <notasas@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        alsa-devel@alsa-project.org,
        linux-omap <linux-omap@vger.kernel.org>,
        Grond <grond66@riseup.net>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
References: <Yrl92RILZwhQOP+e@atomide.com>
 <B6EFBA88-2311-4455-82CB-3E5382C92B4E@goldelico.com>
 <Yrm2dl9EtIb5IYhi@atomide.com>
From:   Stefan Leichter <sle85276@gmx.de>
In-Reply-To: <Yrm2dl9EtIb5IYhi@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oybnNsCrQcFMNNdVav6qWjWobV2noMHfFloaUqghVlFmbM4uFEz
 jsrlx8TPR4wVQZdA00nKtcDvkiKhcupqauyf2SwFsR0PxM4t9Jus3oITRAodR1tzeK+zGK5
 7/rdCOWK0rKqK2YROfp6qysJInNC0P9h0A5YpWQKdRLFycRe2QXimeEssSo1k5cP/n895bA
 dI9jkVD0ytjU5axaHObmw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0Grz+xwM7QQ=:2id109drQSjjc7xcC4zmDr
 IoxHFDj3hPHdGemGxchqSLV1xOMGGlx4OqOvBinkku9OQZWUV9DTWi3EKSLWwPNEuVso06R96
 ArJlN72Zed3vD0AkB5X9xlJ0EhDA3rVdtBnHRQfpHPbW/PNH5XeHxXOJEXTyfYIIZJPjjo4c0
 VWOV+s12xsPAofpJIaSpXQl2xYj2asQlIjnlL/4jA45EVJ3V2GzDp1tTKMRpODrF8gbQ4gqhp
 whOT4nfg+JXewbrOaK3T433oN5Hw44H7ylH5opy/IbutGAG4d0Tu4ArokJXGx7WjJXnS18BQm
 3Pzh0TC+JP/BiS6GxS/7P8mfJvwFg1Ywb9IipV0/vce1irSXY1QKjqywULJkAgEwljvnqGgMG
 nz9Z78Er/nwg6x5xhsU735w3W3lwSfAW0pvH639lL6IREmLVhkft+SzgsM8U+g0R8D9lQjpmq
 6LpXvcN9UCkmtDmfaNMLKvlU76QU9daofh80iCJPLAOcoHPlhz7RYzvY5KKyNPA3Vgdsurz6s
 n5D20zBUwF+2QO7hHgDrF760e2PtKWqRYqJ/P9leBr7y2rafzXIDIC8DFsaOE5PBpQZUjS06I
 OXCDOmeP1OkXm11PQSslTFN7JBFS2XedraaXySsQkIuBSTnvltmVmNmwAvcHiDjrrDSv5E/Wd
 wEH25lfmEfOtrz+EkfxL7IoxyGUkTMwfZxJY84D946x3iuUgWccrryXcxed5M4IDLKWM5QaeN
 YqFYpZtJqRk6lUo9idBaqG46epdWiQjY0mo3liPG4geTUXLMOVHZfbtTHlV7fQ3pZh4SPvNj4
 FDjui2uVCOruKjc21AKE8xEY3dfHe+6OiWBONs6Fheb2wbTRbtnJsb2raptZpbcUffHOZnLJs
 bRMyFTllpYwQAFbXES9Dz11Nzx4VmsmFVOZBcDKRTY4B4KGT90lIj+KXwJyD/3TTXCyi2VddP
 xwnG0EUdtFCw3zfDo21SNaYJOOAfugubtWEP071jDmGP5xWXndm7MOgXTyjQ95DVAiqWKyv0O
 kEPMI8WPUX5WREHBkVdfEKoGkvqm9SaWdd4Lmal/dZBNZyUz+ckSW6MahKBZouxrUsZHLsZ8i
 xLWK/LUJ+nfhB791A411H/5Tv9IqD8GGB8lbGDCCMvJBVCbOnDh1lSNVw==
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Am 27.06.22 um 15:53 schrieb Tony Lindgren:
> * H. Nikolaus Schaller <hns@goldelico.com> [220627 11:36]:
>> Hi Tony,
>>
>>> Am 27.06.2022 um 11:52 schrieb Tony Lindgren <tony@atomide.com>:
>>>
>>> Hi Grazvydas,
>>>
>>> Arnd noticed that pandora audio is using machine_is_omap3_pandora() ch=
eck
>>> that never succeeds for devicetree booting machines. Looks like this h=
as
>>> been broken at some point many years ago with the devicetree conversio=
n.
>>>
>>> Does anybody have an interest in fixing this driver?
>>
>> we already have fixes by Stefan Leichter and Grond here (incl. removing=
 any call to machine_is_omap3_pandora):
>>
>> 	https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dshortlog;h=3Drefs/=
heads/letux/sound-soc
>
> OK :)
>
>> But I don't know who can volunteer to run this series through the upstr=
eaming discussions
>> and do regression tests (AFAIR the Pandora of Grond is broken and he ha=
s no replacement).

I hope that Grond's Pandora didn't break because of experiments to get the=
 sound working.

>
> Probably best that Stefan and Grond do it :) Not sure what the minimal f=
ix
> for the mainline kernel might be to get things at least try to probe.
>

Well, I think I'm not the right person to try to mainline the patches, but=
 if nobody else like to volunteer I will give it a try. Be warned, I have =
no experience with mainlining patches, even not with kernel programming at=
 all. Therefore I need someone holding my hand. Does anybody volunteer?

I had a look to the branch Nikolaus pointed out. Here are some questions a=
bout the patches in the branch:

- It seams to me the branch doesn't support any longer to compile the driv=
er directly into the kernel. Am I correct?
- There are three patches from Andreas and Nikolaus in the beginning of th=
e branch. Are this patched needed to be mainlined too?
- Two of my patches are super seeded by the patches from Grond. My guess i=
t that the patches needs to be squashed together?
- Where should I send the patches? The current audience might be a little =
bit large?

Regards Stefan

