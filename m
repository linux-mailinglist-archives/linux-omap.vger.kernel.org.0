Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB61A4F537E
	for <lists+linux-omap@lfdr.de>; Wed,  6 Apr 2022 06:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233471AbiDFDpD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Apr 2022 23:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1457527AbiDEQDw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Apr 2022 12:03:52 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE523CD
        for <linux-omap@vger.kernel.org>; Tue,  5 Apr 2022 09:01:52 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id bg10so27716955ejb.4
        for <linux-omap@vger.kernel.org>; Tue, 05 Apr 2022 09:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=gn4O4H+OitCZcKG5qhufg6lw6U+twsLrJN1ajaWFlmiYPFzTWLr8DghERpmieumaWx
         eY4eIxSL0jV9y8b0zbAgb5sU3kBAUxn2Q+cgawsPcP3W2ysD5xjJinkh2OW+TFW73tzw
         XCVqfyqI4hwz09yBL4q8yNevyCeFgwn+JoGqNAOLSd7/2LEZTN3LlFiKpkXT5KYIR4a0
         JpqUgb7qBv8BzvpVAfnjRgwjckGlZ2t0pyheot1JSm3VFl2nGXFTs+8Yssj6IqjJdn8t
         onqoWcYcbVA/jDZsQUg7OQQvtXWHw8x/L2bVBZolr2t+FH4u2sXRWVDUUBcytVoWFnDv
         EZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=6bxfT+XXRv1B3TiskLpdGm19Kx1D64UTOgUbrJi9YLbdbXrO8G6yS83h+Pz/A6JkOw
         4otZjpaQMbNCiyVt5zBQjRImTnWihvGVcBdn9xzGF3mxumk7q/kwi8HcqqMUaKZEagVh
         zsk0oIg4miNzKlySih85GHhsQU+nWpwHLosGbyYWTHE8YVX3eHMPplpGD90li2Y+DvFv
         Xby8/GKSnRMsDQDxWl/o9tLa1klBv49ErbOiKIL3NF8t7OMtMuzkjhk+susvNzsIAaWi
         F3ueymv9iON5C2+/0R/esLsiTqKJilqd4RrRDit8SZOtcdjM9zoMOEndKeZes87ntLeP
         LnUg==
X-Gm-Message-State: AOAM530bx4To0wbjibB5qyb7Jse5Q4ggF7pxUX3IGg7YYJ+QlUIDXMaN
        ogwprjq/+v1xExobu2tpmjqh5dpgV5z+6GZT4fw=
X-Google-Smtp-Source: ABdhPJzWBaCBdKoH1xXEoaUogLb3+a+pYr37B+L+cDMsQNeRe7FHrupUj3tA5WcAs9jUf5Fw0DCBL1BaqYr8khU/L5w=
X-Received: by 2002:a17:907:c05:b0:6db:f118:8834 with SMTP id
 ga5-20020a1709070c0500b006dbf1188834mr4319596ejc.536.1649174507631; Tue, 05
 Apr 2022 09:01:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:4684:0:0:0:0 with HTTP; Tue, 5 Apr 2022 09:01:46
 -0700 (PDT)
Reply-To: dravasmith27@gmail.com
From:   Dr Ava Smith <drwilliam48@gmail.com>
Date:   Tue, 5 Apr 2022 09:01:46 -0700
Message-ID: <CAFd1zB0S6crRbDuVQM6Xo9YGTe-rVSapENLtGXoRwpYRxA6JxA@mail.gmail.com>
Subject: GREETINGS FROM DR AVA SMITH
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:644 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4424]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [dravasmith27[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [drwilliam48[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [drwilliam48[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

-- 
Hello Dear,
how are you today?hope you are fine
My name is Dr Ava Smith ,Am an English and French nationalities.
I will give you pictures and more details about me as soon as i hear from you
Thanks
Ava
