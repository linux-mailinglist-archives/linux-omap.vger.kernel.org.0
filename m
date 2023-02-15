Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6770698569
	for <lists+linux-omap@lfdr.de>; Wed, 15 Feb 2023 21:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbjBOUTJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Feb 2023 15:19:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjBOUTI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 15 Feb 2023 15:19:08 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AAAA298DC
        for <linux-omap@vger.kernel.org>; Wed, 15 Feb 2023 12:19:07 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id x2so8017099qkg.7
        for <linux-omap@vger.kernel.org>; Wed, 15 Feb 2023 12:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R2gGqxLxqNawF4ymUsTN9peofYt480TYUTxM5khOmSQ=;
        b=IiuZ1I5sMIQRzDmjPWuuCJeQtBp+teZXSUyja8T/deiXncciUK2Q1cgGY9mJ01Y6vV
         cvEL7Tc+pGFXdcz+rOltoG3WTyEENtW24JMNIrRfb6GuPVmp+F2MSAjcGTToooK06Lg8
         qrNK85iFNUFoPrwrrcXay7uHMRKzTUh87g4m2uTVo4t15ZTsSHDe5ZXbgRqL387NkHdC
         dqdGb2DRIgOS1uIS/zPgw2d/D4a/XIMMnFaAAKgI/VzR/u8azoCGVi40I/GOSJsvT4D/
         8axuNJtTmyDVHQUY3ANK8xDgR1IoMr8EfpexKZH3caLLukB49buJJB8hy5xcBHIy1UfG
         tiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2gGqxLxqNawF4ymUsTN9peofYt480TYUTxM5khOmSQ=;
        b=IMV1CeFSNLectyAmXoj4ALIk8sPoRnDWTV2uwNOEL/oAteyPtyJsUnoNgbWjT/OEUi
         e7f4Ram12euMlyeufF4moOmIiFi7n4mUszsbWBw9EfCaSCPo0UTWnt14epziXErh8WXf
         Dp3Dcz1V0BVAPw16T0E75luB1AGVw2sp80gC2vltwV1CSJynu/aqKKSfLLjL9S4EWO6v
         FWX5/LdF5Y87ZAy+uXFgz9OFYcbNqkr3GAn8gvWIGVe7iDduwwc/OECX6RJw+OrLF1LX
         DFPhOuZhEVW0Hcm8Pf9ikiiWRB/15tS0lfbaRu+9Q5o77P0lD7kd+ZFvjIRBVFFN7bcv
         632g==
X-Gm-Message-State: AO0yUKW/kLkxGAdsVGrtcJIQ2NGBkf+mq75cLLgceGTEPKmIKLd4hjbR
        XfCZYZo1f6B+zF4Wl0lW9Jbd+tLvOzYOVemyiSA=
X-Google-Smtp-Source: AK7set8g56Z7lbgpSCxC+GoP/9XNdkIqH/BTHeQjOFVgLgrzqwsg0eJiN+DFwusEue1moOwILKgFJ8/TkjzE5WcjLfI=
X-Received: by 2002:ae9:f408:0:b0:71f:b8e9:362c with SMTP id
 y8-20020ae9f408000000b0071fb8e9362cmr231661qkl.8.1676492346360; Wed, 15 Feb
 2023 12:19:06 -0800 (PST)
MIME-Version: 1.0
Sender: martines.rose05@gmail.com
Received: by 2002:a05:6214:2f8c:b0:531:bced:4008 with HTTP; Wed, 15 Feb 2023
 12:19:05 -0800 (PST)
From:   Sandrina Omaru <sandrina.omaru2022@gmail.com>
Date:   Wed, 15 Feb 2023 21:19:05 +0100
X-Google-Sender-Auth: riojzanhupjOYWmRSFnt03FciUw
Message-ID: <CAMRr18jSzeW-_8apS0TT-b7ZEQebfMn1cTJcgjvU5AHDiDsLyQ@mail.gmail.com>
Subject: Greetings: From Sandrina Omaru
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.2 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,LOTS_OF_MONEY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:729 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5438]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [martines.rose05[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [martines.rose05[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  3.3 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Greetings: From Sandrina Omaru
Abidjan. Cote dIvoire,
West Africa .

Hello Dearest,

I deep it a respect and humble submission, I beg to state the
following few lines for your kind consideration, I hope you will spare
some of your valuable minutes to read the following appeal with
sympathetic mind. I must confess that it is with great hopes, joy and
enthusiasm that I write you this email which I know and believe by
faith that it must surely find you in good condition of health.

My name is Sandrina Omaru; I am the only child of my late parents
Chief. Mr. Williams Omaru. My father was a highly reputable business
magnet who operated in the capital of Ivory Coast during his days.

It is sad to say that he passed away mysteriously in France during one
of his business trips abroad Though his sudden death was linked or
rather suspected to have been masterminded by an uncle of mine who
travelled with him at that time. But God knows the truth! My mother
died when I was just 6yrs old, and since then my father took me so
special.

Before the death of my father, he called me and informed me that he
has the sum of Three Million, Six Hundred thousand
Euro.(=E2=82=AC3,600,000.00) he deposited in a private Bank here in Abidjan
Cote D'Ivoire.. He told me that he deposited the money in my name, and
also gave me all the necessary legal documents regarding to this
deposit with the Bank,

I am just 22 years old and a university undergraduate and really don't
know what to do. Now I want an honest and GOD fearing partner overseas
who I can transfer this money with his assistance and after the
transaction I will come and reside permanently in your country till
such a time that it will be convenient for me to return back home if I
so desire. This is because I have suffered a lot of set backs as a
result of incessant political crisis here in Ivory coast.

The death of my father actually brought sorrow to my life. I also want
to invest the fund under your care because I am ignorant of business
world. I am in a sincere desire of your humble assistance in these
regards.Your suggestions and ideas will be highly regarded.

Please, consider this and get back to me as soon as possible.
Immediately I confirm your willingness, I will send to you my Picture
and also inform you more details involved in this matter.

Kind Regards,

Sandrina Omaru.
