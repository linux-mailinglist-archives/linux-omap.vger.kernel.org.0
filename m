Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D90C52DD9B
	for <lists+linux-omap@lfdr.de>; Thu, 19 May 2022 21:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236982AbiESTRM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 May 2022 15:17:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243549AbiESTRJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 May 2022 15:17:09 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23A6F56C0E
        for <linux-omap@vger.kernel.org>; Thu, 19 May 2022 12:17:09 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id r1so10665185ybo.7
        for <linux-omap@vger.kernel.org>; Thu, 19 May 2022 12:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=sldeoUHN+XKV/25qdr8o1yS1uyCAwpn/8BNmGuwP1dE=;
        b=IZWcL+lu9ds9p/i4nqQomF6hIfsme0Mr8j8FcrsYFu7AejOZhD2CaNNSGTgI9b5f1d
         W2hX3xcTPK1GZB2SxVrAoMfeXZgm1RV941bt0DHEnKgjYqEu9EmwaCqku9sXLaUDTX1f
         LXhQzwuy8QkscqLhBVynQf9UyT+96Y8FF6OnN0W0hB+Sizkx+0UXAY/trHZWW8lobDM2
         GKxjAx91fLWy1wQIKZmyKd27C1pQY7LLlNveyVroWZ6M2Uct2ksHMk0fnvEj0Yia1qTQ
         KS36+e/J3k+I3ab+HopHBpRPxsUTfb1hOi/nIcuO6T3WIFh9gD0uW4zklXgkoJl5vqDf
         cbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=sldeoUHN+XKV/25qdr8o1yS1uyCAwpn/8BNmGuwP1dE=;
        b=XPMJjl5RRAGxzbLNb9AENmSayfUz1cegVtP2M8RpH108p+zQRlpmYpHhDab2fpSoU1
         TVw2vKS+W92PkL/tcvEPLkHWxsVjEl02uboAVZof1NeK4c1PNuoVCBKX8WB+kEW0Q2dy
         TdZHkFcrVl8mXUlGqHAuQvUwexTly4lLbxryrFDCKJdlV/u44vY+eY6kMiLDGYw2bxbC
         sU1YKIS1wOjX4TdlxRPSxf4ctFICYrIMviRmAlBmvNpgC9f644mk+8lXIlBDJeJIXjYI
         TFhpsNfo27pSvdHBPxEf3ZsRyC6eij0A8OCnAE/nEqBsnbSHOpztdgKHUbVF8AiQIjcj
         j6Pg==
X-Gm-Message-State: AOAM5304nkf1pU515FZpW9o5YPRnGatu3Mb+ul81aCQPWxvaVz+bsnDW
        IarR+QFBsnFIE25gRcfgcOcIhXfe3+9r7ZDsfrU=
X-Google-Smtp-Source: ABdhPJzpSrRSwwktpXAtH1prBlOT123pDsWZuxZ0c2wNDZeoPKXTCiivcubkCxO09kfYDlG1MJ5JxpmGEfAxBOlCaXw=
X-Received: by 2002:a25:3145:0:b0:64e:ac9a:eb27 with SMTP id
 x66-20020a253145000000b0064eac9aeb27mr5869485ybx.630.1652987828099; Thu, 19
 May 2022 12:17:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:6b12:b0:2ad:f417:94bd with HTTP; Thu, 19 May 2022
 12:17:07 -0700 (PDT)
From:   Manuel Franco <manuelfrancolove048@gmail.com>
Date:   Thu, 19 May 2022 12:17:07 -0700
Message-ID: <CA+PGJtDNr9cwK9WRdA5vDWVHCkwvrKmsV0WKnKeWXnTpDSBCjg@mail.gmail.com>
Subject: Der Betrag von 500.000,00 Euro wurde Ihnen gespendet. Kontakt: manuelfranco4love@gmail.com
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_80,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLY,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Ich bin Manuel Franco und habe am 23. April 2019 den Power Ball
Jackpot im Wert von 758,7 Millionen Dollar gewonnen. Ich gew=C3=A4hre 5
Personen jeweils 500.000,00 Euro und Sie geh=C3=B6ren zu den 5 gl=C3=BCckli=
chen
Gewinnern, die ausgew=C3=A4hlt wurden, um meine Spende von 500.000,00 Euro
zu erhalten.

Kontaktieren Sie mich f=C3=BCr weitere Informationen unter:
manuelfranco4love@gmail.com
