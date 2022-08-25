Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56D2B5A0D7F
	for <lists+linux-omap@lfdr.de>; Thu, 25 Aug 2022 12:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240157AbiHYKHa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Aug 2022 06:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbiHYKH3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 25 Aug 2022 06:07:29 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F247DAA4FA
        for <linux-omap@vger.kernel.org>; Thu, 25 Aug 2022 03:07:28 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-11cb3c811d9so22591215fac.1
        for <linux-omap@vger.kernel.org>; Thu, 25 Aug 2022 03:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=NcQgfGWmNtGVcmYOkqhvmNWuEth66CXwSKmPdJfqqgM=;
        b=Vwy3FqtNKslUDofb3sduw9pvoIVRVvXAa3vv0rswSkBX0hN8ApqQAUHQBmdOe4GlWi
         YYQyEwMcmhgWjOyZ7MiD+uFvW2K2PnTVDSylcotr/lYwzIzDZOAa8wxWPEpeCO8hudZB
         VjW2hr1Ix55cgW2KN502F1Ezm8Y3TZNjV60PIfuByyGLgvgV6OQPdHtDTwvwPSGduVhb
         F0T5hBaX3kxYX9yHF0JDPLk7EAicckeOiMbMzJ8k29+F2UsLhd9huxFU26PDzispcTvu
         yd/O5FadSKer7YAXd/0AOc49v0bgs8g3zHrdhDQY+PDCDkE44w9jz++lSophx9cnbokZ
         Wq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=NcQgfGWmNtGVcmYOkqhvmNWuEth66CXwSKmPdJfqqgM=;
        b=jyE8RE+nK2F2+ZE+ipmHndZSwisHtysbwdix22iRE8+1vKWiVYJq3Y5A4usvoxVGDj
         ddrSi6DlFdjgMUdXT8RkW1C5uGMKpwVE/H88SaPqgLI8ZFikWVCkrSKMyToo2EY6SnA4
         Lslviuda9nAxYgbX4tqk4jWBYZmTGSgz8d1Xc4TvQO3+Ou0W8c0CtkmTife0VTVKjkHg
         Zo2zTKtUfrwQ3UpNJ3eIrC7q7gNEm4kYxIScVAz9pRxu33rq4O7N8OihOiAJdDmNuBkt
         t+jvQtHMupGSwmQ/F2ZoxlttSEHZNBF4SjbzVQ04H5VRx1sMPRxu07mIVEiNBXa02KxR
         shtw==
X-Gm-Message-State: ACgBeo0qpydJxS80fTm9+ed4vuDuk63jhoF4UBTCLO6AihdA4/gJgqRW
        sOuDRTjPzlXPbvGotvk0X8b3fBy61HiksSw5NOA=
X-Google-Smtp-Source: AA6agR6V6De0g2rjSLj8DKCEEuH67eB+gxGSjzhqX5jim5wBdtKaIxBGuOjzPQXnG7Ivg9cGk2faZ4ixlc3SmoPNEts=
X-Received: by 2002:a05:6870:4302:b0:10d:c587:d30e with SMTP id
 w2-20020a056870430200b0010dc587d30emr1625667oah.28.1661422048226; Thu, 25 Aug
 2022 03:07:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:5ec3:0:0:0:0:0 with HTTP; Thu, 25 Aug 2022 03:07:28
 -0700 (PDT)
Reply-To: sgtkaylla202@gmail.com
From:   kayla manthey <tadjokes@gmail.com>
Date:   Thu, 25 Aug 2022 10:07:28 +0000
Message-ID: <CAHi6=KbqXP4cBq0m=FKQy1WqvcKg6uAdmqKdjYJxOt_qoUZJFw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2001:4860:4864:20:0:0:0:30 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4980]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [tadjokes[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [sgtkaylla202[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Bok draga, mogu li razgovarati s tobom, molim te?
