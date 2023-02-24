Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0726A2220
	for <lists+linux-omap@lfdr.de>; Fri, 24 Feb 2023 20:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbjBXTIT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Feb 2023 14:08:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjBXTIT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Feb 2023 14:08:19 -0500
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C7CB1815F
        for <linux-omap@vger.kernel.org>; Fri, 24 Feb 2023 11:08:18 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id ev13so117043qvb.10
        for <linux-omap@vger.kernel.org>; Fri, 24 Feb 2023 11:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/krrOzf32PMDRBi/P9qe9m671OONK8NSr+9AstJjJkE=;
        b=lq6iyj0EKEfQqTglbgRZALTdd2iolrg+mZLgfyfnuVsB4IgmyuDLcMN6i6GuVZ9LOj
         gUjXjWwISfO71A6rCgQ8gCvy5Z+2N9vcBspoVTHaicXj43zSHl/8fGnJ+/bZYMFhOfKl
         czA/TkxP9IOjyfxU/duJ/1Ec05mPty6AAlFP55nKjbRVeb+WQIh08yHMBJYr3xf/afdL
         16JaC4xyGt0ZTv0vRp9o4EcElhP5Jct64R9371YE5Uk3d19FNoiZTS/gV/6dcj+CYWyl
         Kj+KZLLNoOv6Aw00qLzDtH8I7M7VrFDHjnZkTX0W2daqxnsYb+V66y4T8nXrX50j3xfn
         HHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/krrOzf32PMDRBi/P9qe9m671OONK8NSr+9AstJjJkE=;
        b=fV1eNiPKZJqdl154XCX7vbNtpLoXAF/Y9Ri+ngoXYxhlaZbmmz1GdhywqsxK/lwlco
         y9eA1RWZKoCK7gpkLIFp4dmX8j8W4Qxn2Ek8GfEVjBQN3/FHmDTWO83ucdp3V1z/9GiA
         JO6ekqIMCfrEbTbrcgh4kLCpT4hVUbRPktgAVTGJlQx5Oqv4d6TPGVRESUg+ibc7kG+Z
         3AQuflTLag/0erjIXKen9Qw4Pn4aYsKDJ49/Xb3r619ywAHkM9Td5ciPn0fJHduww5+j
         YzOxTPhpNU/tZvBrqE2pSOJ2SWuWHfEjgBkBOfPaQJoCbyO9bZwpJ7TEI3b5BZbijJsN
         MGeg==
X-Gm-Message-State: AO0yUKVQWwpo9zNhZd9BMlnbyKKdZz4QaHgOIhLMWodQYSSfAdivlKgb
        mfMTH4KQD29BJ7hLXgqVy1JTmwbzi5+zNFLjWQE=
X-Google-Smtp-Source: AK7set9UUnEX07CRkjzbPdK8zWln6h7gK+1gPjZxG4CHzOgXcW6u7Xvj+O82/dbLV0kBvhlXrrOcIPNS6Lhqikgr8Oc=
X-Received: by 2002:ad4:5502:0:b0:56b:ee5a:89f0 with SMTP id
 pz2-20020ad45502000000b0056bee5a89f0mr2838750qvb.7.1677265695154; Fri, 24 Feb
 2023 11:08:15 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad4:438b:0:b0:572:2b9b:a3d4 with HTTP; Fri, 24 Feb 2023
 11:08:14 -0800 (PST)
Reply-To: avamedicinemed3@gmail.com
From:   Dr Ava Smith <mrsmalingwansuzara00@gmail.com>
Date:   Fri, 24 Feb 2023 20:08:14 +0100
Message-ID: <CAGYVCFB5eLGTy8qSgtabJwm5wuQEYtRHCgQPchyroqv23_UNgw@mail.gmail.com>
Subject: From Dr Ava Smith from United States
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:f2a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mrsmalingwansuzara00[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [avamedicinemed3[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mrsmalingwansuzara00[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

-- 
Hello Dear
My name is Dr Ava Smith,a medical doctor from United States.
I have Dual citizenship which is English and French.
I will share pictures and more details about me as soon as i get
a response from you
Thanks
Ava
