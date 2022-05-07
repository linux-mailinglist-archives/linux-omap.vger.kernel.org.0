Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFF451E875
	for <lists+linux-omap@lfdr.de>; Sat,  7 May 2022 18:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349259AbiEGQSB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 7 May 2022 12:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232965AbiEGQSA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 7 May 2022 12:18:00 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC2F12409B
        for <linux-omap@vger.kernel.org>; Sat,  7 May 2022 09:14:12 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-2f863469afbso108801347b3.0
        for <linux-omap@vger.kernel.org>; Sat, 07 May 2022 09:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=QTCWBzEezgLv+Z2QZNvCkKQgrxXaSDur4w34RcJaRzY=;
        b=QYawFWpwZBWwuipWFWMI9eyI1y/OBWWmtfSzTNhg8anmpQszOP8TpyoiOnLDzfJXey
         69u4trqpviFrQOWM/v/daz331AAPQjTwrMm+8Hsh4gaHCq4uX3DSC7aUX8AVaErnTkpe
         RZKeIxrdiKHLNhcbQJ3aER92zWxsOf0PMkOp2U8zo1ca58aL/iZ10wY7oxaZLgFAWP6E
         l5vbKZno1jYjNd8sq3AsVBj6cJUU19G+2uAa73v91HFOf7dpOex+9Qw4SUQ7KnF9E9Hn
         55zJuYemfKeEWkNK/J1gHQtoNXcRQ/Gi/5vetE+pf21lw04p1nMMMfEdzb227ysRQ+qy
         YCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=QTCWBzEezgLv+Z2QZNvCkKQgrxXaSDur4w34RcJaRzY=;
        b=o15Fai+OSMRaGgLtMyYry4WhaYcbTgDp6h2+n1Vrmy2p1vTEA5pRopM7ZmF/Eft/Pr
         jwCu5gPmMUNN3QkYdsgRuiKp/3TP2/4fzItrWzkDQjzfBQJVT3EW7GoD2x2vVVjNimqK
         LmLq6bdOa6zPHgcK5lGV40PklYvco9XfoNW4CamRGQmRA5FdU3TPfbf8plzsapziL0ez
         pgUHi5cIJxd7z9jzetRI2kJ/Vk1pfZYDBVyv1lUsp0WGLgDVktczvMZcx+XthjXs91+D
         VBCGFw0zgOBV6aUHU/aTADVO1YRHhK+qtk4TIUcqLipj9kk+RBTdol95Lpj9nMvzUgU7
         bL0g==
X-Gm-Message-State: AOAM532UXxaTwCNLnTIUgsiXP6bMBv9L2nTcqinJZ218d8rNRSpcvffe
        Z+uqScfzVUJgUd3BZgdMDhd4BRlOz8xHavo4sug=
X-Google-Smtp-Source: ABdhPJyxTuGQx0hJaoAOVAd9/er5bL3gglUaBQR6oV4RplFIWq+cTw0+jXehPHu27wX10Sx9bYbMTaTmF4+ZQWGX2LY=
X-Received: by 2002:a81:8cb:0:b0:2f8:9f07:5a12 with SMTP id
 194-20020a8108cb000000b002f89f075a12mr7207688ywi.373.1651940052039; Sat, 07
 May 2022 09:14:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:4753:b0:179:3f9b:c9b7 with HTTP; Sat, 7 May 2022
 09:14:11 -0700 (PDT)
Reply-To: illuminatifame157@gmail.com
From:   illuminati <avendeidoutimi97@gmail.com>
Date:   Sat, 7 May 2022 09:14:11 -0700
Message-ID: <CAJW2nWXtzCrMHznmhZ3zK+HF3QxkrBfS5pWE1TE8E0X-Shmfvg@mail.gmail.com>
Subject: illuminati
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1131 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [illuminatifame157[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [avendeidoutimi97[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [avendeidoutimi97[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.5 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  0.4 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  1.9 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

--=20
WILLKOMMEN BEI DER ILLUMINATI BROTHERHOOD ORGANISATION, einem Club der
Reichen und Ber=C3=BChmten, ist die =C3=A4lteste und gr=C3=B6=C3=9Fte Brude=
rschaft der
Welt und besteht aus 3 Millionen Mitgliedern. Wir sind eine gro=C3=9Fe
Familie unter einem Vater, der das h=C3=B6chste Wesen ist. GOTT
. Ich glaube, wir alle haben einen Traum, einen Traum, etwas Gro=C3=9Fes im
Leben zu werden, so viele Menschen sterben heute, ohne ihre Tr=C3=A4ume zu
verwirklichen. Einige von uns sind dazu bestimmt, Pr=C3=A4sident unserer
verschiedenen L=C3=A4nder zu werden oder zu werden. einer der weltbesten
Musiker, Fu=C3=9Fballer, Politiker, Gesch=C3=A4ftsmann, Komiker oder ein He=
lfer
f=C3=BCr andere Menschen zu sein, die in Not sind E.T.C. M=C3=B6chten Sie
Mitglied dieser gro=C3=9Fartigen Organisation werden und Ihren ersten
Vorteil von 1.000.000 Euro erhalten? Wenn JA, antworten Sie bitte auf
diese E-Mail: illuminatifame157@gmail.com oder WhatsApp the great
Grandmaster mit +12312246136
