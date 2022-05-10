Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E94325223B3
	for <lists+linux-omap@lfdr.de>; Tue, 10 May 2022 20:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348783AbiEJSTv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 May 2022 14:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348898AbiEJSTn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 May 2022 14:19:43 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B0C2B8272
        for <linux-omap@vger.kernel.org>; Tue, 10 May 2022 11:15:19 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id n10so5476166pjh.5
        for <linux-omap@vger.kernel.org>; Tue, 10 May 2022 11:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=xVJHepNq93ePmAbCv1LHbdOWJcqWYQh8v11fr0KUdVw=;
        b=HgSsKBi5k0fBFVaRT3c2wk58w2JULl54e+PSGu26qGqlTVFrSRSJ+FiH0YYse/uYz/
         kFpkwW2bbWhl17NGTC7wwsarTerdi0j2KLG1CbweEHhWeGZMbV7d23wd2afwmwZtiHAG
         SEzwGc5cLSToV22krmEZGW894USkUbUaear+hT+1TthF1rFLJ2hYw/6ZMItew4TG/OmL
         R5GLLmt1wiiR/om+VyBo4wDTww5AKRYH+Y2PM3hy4t5sOCHZXhjMbgfKG5EpLXoiG2Yn
         KAD15eEkk8vnI0Flz0HICOlPpt9019Z+MyoPkOR7VhoFm2kSvURMOU7rUe02Mj2rruEj
         WcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=xVJHepNq93ePmAbCv1LHbdOWJcqWYQh8v11fr0KUdVw=;
        b=eCZU6abSywR4GuDAX/xYRNic7livgsLNCrs0eCJ/JXbSTRbXNq2Owf76FbT1nu93tC
         w+xveOnHoGjpt0yO8D/BzExrcsB/L2d1nDy1NfO2StJgFPOOdnu3l6vlX9Q34SQwqYGA
         MEE3cWH7ayWa/xNEOpZw/8cbeSZwukXi+Ebd0d8wdU4EnpTA/8wPASMPn6vT+kprFJlI
         jK2JUMI9K4SxhEBN2w607AibgXuA+fXu2nN1TOTZbmH1JuoDu9kKFEb+YpqinIgBmEh/
         Eh4n6xZK0NZi7+5XOGb9OVi8HXTRtfJZJ9D1u1el9uAVD6KVLy4zll86uf2rfeD3IQtt
         x+fQ==
X-Gm-Message-State: AOAM532Eq57dHgJIAzju0Oucle2GbBgZ/bBx2yHXyI+BsAxqM3IGATj1
        Zs4fekSvd1fnfuE7YOulMWSVod4+fgbAhkq1I4c=
X-Google-Smtp-Source: ABdhPJz4jXQJ/UD8MhuVFwYpgm8f2BOv5bvc9n7ZRcoJ2zIZZov8kWaETwlfELbSqEOglVth1S/HxQgeZDTe/PMkqNY=
X-Received: by 2002:a17:903:2002:b0:15c:686f:da1a with SMTP id
 s2-20020a170903200200b0015c686fda1amr21568109pla.30.1652206519258; Tue, 10
 May 2022 11:15:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:8ecf:0:0:0:0 with HTTP; Tue, 10 May 2022 11:15:18
 -0700 (PDT)
Reply-To: lilywilliam989@gmail.com
From:   Lily William <ysani0298@gmail.com>
Date:   Tue, 10 May 2022 10:15:18 -0800
Message-ID: <CAENZtnV9z=ZUsmPoF=qibmvDNeogKiQdqh+HYDj_ryZ3JX2p7w@mail.gmail.com>
Subject: Hi Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1029 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [lilywilliam989[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ysani0298[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ysani0298[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.5 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

-- 
Hi Dear,

My name is Lily William, I am from the United States of America. It's my
pleasure to contact you for a new and special friendship. I will be glad to
see your reply so we can get to know each other better.

Yours
Lily
