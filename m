Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB865B8F4E
	for <lists+linux-omap@lfdr.de>; Wed, 14 Sep 2022 21:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbiINThp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Sep 2022 15:37:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbiINTho (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Sep 2022 15:37:44 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C89F7331D
        for <linux-omap@vger.kernel.org>; Wed, 14 Sep 2022 12:37:43 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id s10so18896927ljp.5
        for <linux-omap@vger.kernel.org>; Wed, 14 Sep 2022 12:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=2vJHlqQj2D5js5r0I2Y1BVF4byvG2P2spYzFG+ucJkc=;
        b=n+vDqW96e9+hkUfdQfMkm5GdTw+646b5y459jTh54cM7t/SC+3KWoCQvpxB6syQwof
         z+mT9IskAHI+kGC32OS832VU7CGxhw++6kSQNE+KrIUCJJlKWhaLNv9HehKwV8lC8g20
         kapZL1FHHIDHCBOH2vslppH2TuTSZ6xsT6N3qDjiOLGH/n0NuOj74t247zIF6vtgUpR3
         YczvUEEsH58WpGyltnIEnNxfN+g+i5mpdlkUxxlaW6s2VXMH1MtK0vIrX9R3LVGRGlTs
         3PvX971/+u2VtNzePembNL7p7Uh7m0SuPTYZYqk78S+L7xsJFfw2pD0nFlr+2P74rGIZ
         /Fzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=2vJHlqQj2D5js5r0I2Y1BVF4byvG2P2spYzFG+ucJkc=;
        b=h1e2iLYkjJ+MVUsZ0IbgEdDD2co0MVcX6xbBusb1dLdLsX5Yd9f0Mr9FdXlz2U5dBH
         Sq77anI9gFKU8Dlj/P95vsqv+L9xvL5+c2DVWJKhB7qE3MvM/CCYu8y1+mpjAfXZYatW
         x3x1wfDaMXGy++p58ZHNxhhDkKXMfkzvOAShxyayWF6exz2+R1ye5hBQlh8q0JjtWWmt
         Nmb/KPoIffZyECy2C2jmhHwYucvYT4cNwe2AlEwiaIYs0VYS1wO9ap44b5bfwGTwLjrv
         Sz7VpAbnH43U1apbTskdEZitLyuU10VTDxemTC5LNjA2zicWkvsAghPQ0Nv8Gwlk25f2
         gg6A==
X-Gm-Message-State: ACgBeo0lE+ZGZGLJCnGcO4oYXGK56p421qdziVAHVtCRjxT7baozbAlz
        VdA0QAdckIIO6tt1ZP2G4iqjNeR5AZv3U0Rz9SQ=
X-Google-Smtp-Source: AA6agR5+NYzhL+T62zYMcXLtd9mhoQSGS3rlcpQRT0eBqNbctq7W+DaUbS5JZgT20+cJq1PH42+EX0oc0JjA5Ia9U/k=
X-Received: by 2002:a2e:a314:0:b0:26c:1e32:506f with SMTP id
 l20-20020a2ea314000000b0026c1e32506fmr2384645lje.162.1663184261537; Wed, 14
 Sep 2022 12:37:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:a583:0:0:0:0:0 with HTTP; Wed, 14 Sep 2022 12:37:40
 -0700 (PDT)
Reply-To: bodeg41@gmail.com
From:   Bode George <fbiinvestigationf1@gmail.com>
Date:   Wed, 14 Sep 2022 20:37:40 +0100
Message-ID: <CAB01aPrvTeSLbry23c-1T3O82Tj2M9JO4XqerEtngh9NezmQmw@mail.gmail.com>
Subject: For Your Attention:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5234]
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:242 listed in]
        [list.dnswl.org]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [fbiinvestigationf1[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [fbiinvestigationf1[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [bodeg41[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

-- 
Dear Friend

I need a Reliable, Honest and trust worthy person like you to receive
my fund for our benefit or investing it into any lucrative investment
opportunity in your country

or around the globe as you may deem it fit. I have investment interest
in your country with this fund but if investment is not in your own
interest, whether investment

or not investment, this fund as you receive it will be of immense
benefit to both of us. Therefore, please contact me immediately for
more details and requirements.

Best Regards,
Bode George
