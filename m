Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6CF5B06B8
	for <lists+linux-omap@lfdr.de>; Wed,  7 Sep 2022 16:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbiIGOcB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Sep 2022 10:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230252AbiIGObl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Sep 2022 10:31:41 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F2D92F393
        for <linux-omap@vger.kernel.org>; Wed,  7 Sep 2022 07:31:37 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id b16so20029487edd.4
        for <linux-omap@vger.kernel.org>; Wed, 07 Sep 2022 07:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=UTPjlhWN0j/3cl0uibj9IdU3K9tIHCNTd74bAPWV+BQ=;
        b=k+kTmF4dNKKC1tFdYzcwH7/l46epf5FbUFPW9fotRQ90/DS7R3h9yaNhOg0lTJdIKN
         YHdSCTkM8Zkjp7Hn3R4P0XvsDr7GxfmeGBL++Unk5TJmx9qVPx583aTDfnV2PWRJleSF
         V9CWF3CXrTGHaUKzdckweUxspufsytFwPi4BnYsAOc2hSOm8q6pA2t/VPIekeXstFpXE
         htt2kpsyRtvUjut5U+QWEOTH3kFoTjQxxF4WczaCcSaHvXanBanYGkEYwnM/Vnd0ubg4
         W8etIyyum3dHJgEwMgk9+gvP+Ht+yKtyVUWfAI5wHJqHC9VVX3XlSnd5oyt/DWf9M1PE
         uqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=UTPjlhWN0j/3cl0uibj9IdU3K9tIHCNTd74bAPWV+BQ=;
        b=puVAENW3yOshAZf/6NTL9g06cRVgz876Xo9WFwAs5/mMwdvIWamhVxyYwETbVnFpLL
         f5/FBlZOS3vtCJwzokKCWIgYZpgPA18jOj7UjX80KCGKpZBTTxckDFGiZ+1KrrG+2fR8
         dcX2IVIhUeU4Owm0z59i9HgI+e4K1GNxpd4wd5KarfmdWwRUWKeATSC0lIWmKe7UdI4n
         LBrS+7uHn/U7Pj2w/Qhr6O6sxusCKd3WOvqNQHTPhq3JqkJ9cBrTJcLntawdAk78uFGP
         p7o2+ZpHjoQ2r5n099Y+OAVS1k0y+C2WRlGxzvgWmzLA15iHO4afZY1XZ5hA8aJSaTa1
         Y3hw==
X-Gm-Message-State: ACgBeo3OHIxdkS59xyFjm0nuAPzI1zYLXT10b6nqiYS66BdmHgqtJXfP
        bcH730NoWx9dvrTy4yz4OrR3esxRfosRabAs2nw=
X-Google-Smtp-Source: AA6agR7oVOAvDjQn3BvyL8TRl7TU52ugVo1oxft3hLVGbPDpO77yZb9oqAmvuH8HvlLOfxUiSLCWLP4h3TKLUQD64AM=
X-Received: by 2002:a05:6402:2937:b0:44e:b578:6fdd with SMTP id
 ee55-20020a056402293700b0044eb5786fddmr3322109edb.159.1662561095860; Wed, 07
 Sep 2022 07:31:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a54:3fc4:0:0:0:0:0 with HTTP; Wed, 7 Sep 2022 07:31:34 -0700 (PDT)
Reply-To: lumar.casey@outlook.com
From:   LUMAR CASEY <miriankushrat@gmail.com>
Date:   Wed, 7 Sep 2022 16:31:34 +0200
Message-ID: <CAO4StN1ngaz5Z=OEaG_ttEwdR6_pWWO2Esip5rtKi-tOEu80oA@mail.gmail.com>
Subject: ATTENTION/PROPOSAL
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.8 required=5.0 tests=ADVANCE_FEE_4_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM,UNDISC_MONEY,UPPERCASE_75_100 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:541 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5020]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [miriankushrat[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 UPPERCASE_75_100 message body is 75-100% uppercase
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  0.2 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  0.0 ADVANCE_FEE_4_NEW_MONEY Advance Fee fraud and lots of money
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

ATTENTION

BUSINESS PARTNER,

I AM LUMAR CASEY WORKING WITH AN INSURANCE FINANCIAL INSTITUTE, WITH
MY POSITION AND PRIVILEGES I WAS ABLE TO SOURCE OUT AN OVER DUE
PAYMENT OF 12.8 MILLION POUNDS THAT IS NOW SECURED WITH A SHIPPING
DIPLOMATIC OUTLET.

I AM SEEKING YOUR PARTNERSHIP TO RECEIVE THIS CONSIGNMENT AS AS MY
PARTNER TO INVEST THIS FUND INTO A PROSPEROUS INVESTMENT VENTURE IN
YOUR COUNTRY.

I AWAIT YOUR REPLY TO ENABLE US PROCEED WITH THIS BUSINESS PARTNERSHIP TOGETHER.

REGARDS,

LUMAR CASEY
