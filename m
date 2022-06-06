Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2817953DFA7
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jun 2022 04:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352116AbiFFC0i (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 5 Jun 2022 22:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238058AbiFFC0h (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 5 Jun 2022 22:26:37 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728C944758
        for <linux-omap@vger.kernel.org>; Sun,  5 Jun 2022 19:26:36 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id x16so6262857qtw.12
        for <linux-omap@vger.kernel.org>; Sun, 05 Jun 2022 19:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=edeevZ54MxyNr2ONaDsC9jI+UtdZjrCL/LCuSFC70Ao=;
        b=QLAec17iePVHUkXdvZRLDnRtBAm2scfBGR+TWwBFEeGWPxC6fiUQ9fWQgn+4kXwWGE
         u0yB21awzTwlp/htvdnqOu0aKI7zPNSTRM12OvUlibfh8toDLTkh9L9HOxGlQDZ4XTJ8
         Lj96GJeSoWbReKttNJinnw7y3d+zLWozrcLAbRazXJaI+clQxJ410lPdb6UgTpMdnrLf
         DVd/ZQtyzs5twRNx8OBZNQY1nigtIRR4tuxJTiMjGXkJoPbGCz4ESoJXvzFUi1k6caIe
         g7As7eYjlUDf8+gbBaJPTPGDcoLCjqjsFcUsNQSv9USLFBJ7h2Qh7sxTnebfzpEqEAX+
         ZCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=edeevZ54MxyNr2ONaDsC9jI+UtdZjrCL/LCuSFC70Ao=;
        b=l3RkEqtT8M/CzUguBpvDuFsM9dpo2G784IcN5gJcLabDzqZlKUyKrnhlzuZsb0IiEi
         OqnEcpYlsm6tUwgZZpxuteMBNzgcXflmXghnJbGS1Mer6UwiWbu9xuNaYK1zb2sjK30Z
         33Yp9jdrvuAJSan7WprCXpwRamU0xJskc9AqYTmCe72B2jj4UmhpF7OjatfvLOAYLpCe
         wh+DBRxzjnwZVrKduT4ULeRuR6jX4cSlUwYdYyXaXseANAlexoVLPrIXkXGS5OsNlEJ6
         ByEuUsjP49jc8CvQ86t/2CPUngejt83oWAIaxu4x70nRe5HHBo51AOjV2WSY8Wdvs6Qq
         XH9A==
X-Gm-Message-State: AOAM5304XAZixRE0EmKbcaVZzkuUum1CP9bgaq3GZdpnL6UD94KaN3mi
        q0AoR153BcrHNMmDEXfgPltE3zdqRfl7ilckozY=
X-Google-Smtp-Source: ABdhPJzBtKKw3z6f+YkUYAYuUT9IYIJyOStM48l7F4hR8I+d472nzM780wxWEruBZe6uV8FiAZbhpejwTJ53DR/ffSs=
X-Received: by 2002:a05:622a:13d1:b0:304:c6fb:129d with SMTP id
 p17-20020a05622a13d100b00304c6fb129dmr16443751qtk.558.1654482395312; Sun, 05
 Jun 2022 19:26:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:620a:2948:0:0:0:0 with HTTP; Sun, 5 Jun 2022 19:26:34
 -0700 (PDT)
Reply-To: mohammedsaeeda619@gmail.com
From:   Mohammed Saeed <samejafgbnmn@gmail.com>
Date:   Sun, 5 Jun 2022 19:26:34 -0700
Message-ID: <CADB+x=U2+AgrphaVVwJCy03S0fF5NSKE9S3gyo4UVYNQZSbk4Q@mail.gmail.com>
Subject: Proposal
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5294]
        *  1.0 HK_RANDOM_ENVFROM Envelope sender username looks random
        *  1.0 HK_RANDOM_FROM From username looks random
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:842 listed in]
        [list.dnswl.org]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [samejafgbnmn[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mohammedsaeeda619[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.3 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Salam alaikum,

I am the investment officer of UAE based investment company who are
ready to fund projects outside UAE, in the form of debt finance. We
grant loan to both Corporate and private entities at a low interest
rate of 2% ROI per annum. The terms are very flexible and
interesting.Kindly revert back if you have projects that needs funding
for further discussion and negotiation.

Thanks

investment officer
