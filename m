Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4B016F4379
	for <lists+linux-omap@lfdr.de>; Tue,  2 May 2023 14:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233992AbjEBMPp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 2 May 2023 08:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234140AbjEBMPo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 2 May 2023 08:15:44 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC533198A
        for <linux-omap@vger.kernel.org>; Tue,  2 May 2023 05:15:42 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-18ef8e9aa00so3063340fac.1
        for <linux-omap@vger.kernel.org>; Tue, 02 May 2023 05:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683029742; x=1685621742;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UFDCcpPxDmkQZsud8dmALV/HSiV3stf7Ud3TXlSZ1wA=;
        b=Em96I0iTF2A6o3J/ORbPNgTQDb/X5WPO2+3u9AnRSaUwbbtikDeHttGXBticraotaC
         RhxV9mGQVQj4tjbfZx7r1ccBoX4O4NEcXfPXZXGh3l7H4Ft7kgSuhN/9jh5Qd5fVK5pH
         ikn71Tk8SZC48NhHClOCCgBDxC8NICVFpEXA4QupryUHJnT6vJkIKOfcUNoxeQ73oBjg
         zgCC9JjagCyBOzCTZ44ZuzraHsbJd5sIBDHB6btrLz1e3AumteJRJ2PgbQOqa0qJ0qzh
         a9bVc0YVl9KTEs6ZtbqpI2qzB1dCaBWlv+CKMPu+ftaGeXXB7+eiNN6jsTIVYw0kvRCD
         kxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683029742; x=1685621742;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UFDCcpPxDmkQZsud8dmALV/HSiV3stf7Ud3TXlSZ1wA=;
        b=F+/aMMdGjxPs2s7Yq5tjHrIOEaGuXv0D1HF87AOoVNseNYcy90K0nEvrXh9WsWHqhA
         hjuwL+2bN4tFMP5Brj3CyNcJkTOKAE4E3icv35vPFmlJ+cojjPp3mB4brizDvxPUHCYf
         HT6c3LB4fkY3S3jK2g27TAsKvy2FvAxymi3kMx3hc90LiXS6sl1TJw0VwBlmOpqApnfU
         JfOuEqFGE2ajtrXJCljbZqtjsibVvKwcY4PogyuM/GabJrWe42nkBeKa0V1yPyfQJ6vJ
         nr0yglZvxlxSsFe22HybTGRkgDIhAvPT+tc/TKJSUfwVyVzjFYetlopGj34RPgfjIPD9
         soLw==
X-Gm-Message-State: AC+VfDy5tK7X+xvYU8KX+so3+xlSrY6Iys/SpoufUyEPCh+PWVaUM1a/
        aSk6pzKuedn69QizpfVl3OERiG3eJVcpOn+Zs40=
X-Google-Smtp-Source: ACHHUZ7A6SbxrSbXo/QVeZo2lhTICROhzUdLaf9rigkMM+uiUSpVaVaKvSQGYPy7OvR9R+KnBp+8kdalZGV/1uhMq34=
X-Received: by 2002:a05:6808:6:b0:38b:5349:e112 with SMTP id
 u6-20020a056808000600b0038b5349e112mr7478821oic.46.1683029741755; Tue, 02 May
 2023 05:15:41 -0700 (PDT)
MIME-Version: 1.0
Sender: ericgloriapaul@gmail.com
Received: by 2002:a05:6358:4903:b0:11a:758f:2411 with HTTP; Tue, 2 May 2023
 05:15:41 -0700 (PDT)
From:   Stepan CHERNOVETSKY <chernovetskyistepan@gmail.com>
Date:   Tue, 2 May 2023 13:15:41 +0100
X-Google-Sender-Auth: 8WASfav0oDciR8-v2NgO5GSztsc
Message-ID: <CAApFGfT5BJC5HikDxBuWaOaLmtj1tR8g8GVbAKK9PMK+FuX7MQ@mail.gmail.com>
Subject: Investment Inquiries.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.7 required=5.0 tests=ADVANCE_FEE_5_NEW,BAYES_50,
        DEAR_SOMETHING,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2001:4860:4864:20:0:0:0:2f listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4858]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [chernovetskyistepan[at]gmail.com]
        *  2.0 DEAR_SOMETHING BODY: Contains 'Dear (something)'
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  1.0 ADVANCE_FEE_5_NEW Appears to be advance fee fraud (Nigerian
        *      419)
        *  3.1 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Dear Sir/Madam,

Please do not be embarrassed for contacting you through this medium; I
got your contact from Google people search and then decided to contact
you. My goal is to establish a viable business relationship with you
there in your country.

I am  Mr Stepan CHERNOVETSKYI from Kyiv (Ukraine); I was a
businessman, Investor and Founder of Chernovetskyi Investment Group
(CIG) in Kyiv before Russia=E2=80=99s Invasion of my country. My business h=
as
been destroyed by the Russian military troops and there are no
meaningful economic activities going on in my country.

I am looking for your help and assistance to buy properties and other
investment projects, I consider it necessary to diversify my
investment project in your country, due to the invasion of Russia to
my country, Ukraine and to safeguard the future of my family.

Please, I would like to discuss with you the possibility of how we can
work together as business partners and invest in your country through
your assistance, if you can help me.

Please, if you are interested in partnering with me, please respond
urgently for more information.

Yours Sincerely,
Mr Stepan CHERNOVETSKYI Leonid.
Chairman and founder of Chernovetskyi Investment Group (CIG)
