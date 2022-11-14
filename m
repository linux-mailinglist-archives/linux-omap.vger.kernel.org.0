Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C776662742E
	for <lists+linux-omap@lfdr.de>; Mon, 14 Nov 2022 02:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235614AbiKNBcS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 13 Nov 2022 20:32:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235430AbiKNBcR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 13 Nov 2022 20:32:17 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D13C19
        for <linux-omap@vger.kernel.org>; Sun, 13 Nov 2022 17:32:16 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id f27so25011509eje.1
        for <linux-omap@vger.kernel.org>; Sun, 13 Nov 2022 17:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2A5Zw4wTof6wwwRVMT2EklD6tpS33zcb3kC2X1CkRqg=;
        b=cVSrKxrWfTF+zSdGici4PM07zxG67TR+qaSgbucf2F1NLpGQAC5yUL1JJiA05RBWLk
         ABlOkBX5SJOrE+e+f2e9aKNtklegGpCzTIca9QIxiM01NAG/eO1A+h+yNW+LnR+z2/T0
         X8DkeT0hL50I8T+1b+xiY+LKKbkz0c1Cl5F2cCdEp4f2LdUC0qqvXeu0zTBrSlIh/3zM
         RA4yRVgpImE46NM+r4T4mObkDyrwrB8DxPtPsNat7u3yl3eS3uvMe5cW4b/IPYxcf2W9
         OpcIe8uWqwy2Ss0sUkXdlgZELOVlxRcFW7IUDSxseJK7OKPHPYobnVZxqwupX+iYdnvB
         Ys2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2A5Zw4wTof6wwwRVMT2EklD6tpS33zcb3kC2X1CkRqg=;
        b=VXxHLO4gKRSkrC6SZ98YKKqw5MBcz05oAA5YZVrJkcnwCJKIVYF0AvuCbZhSCM+q/D
         92rtgyM8yrkkCHAnwh4e3r87mB7PKnp1Vbz4CyPkYcRdJ4hTGkUin4mu1cJ4GiGr1Yhg
         OBcJJdFH7iqn4/7CpvqeaKfW19evyr4Nl8q/VO3yv4RAuvYvuTE9fHBdfshgbR4kFDuy
         9Pvc9r/LNRo01bKdVdPARk+fcHvqeqHmhKDNDQuqyXzNs+qhBDdN3hHcqpbTx6z4ZIAO
         9Tz5u4u+B3TBfrvY6kDpS7fOQqSXifUyY4nRBSAMSkterkkvufmIO3oYf+K4Dum8aZK+
         QAZg==
X-Gm-Message-State: ANoB5pndZjEE3kp48TJq3JjiQ9z+zlnVThDs+y2w7nGW5b+xHZOTQ5NN
        74w8SZ/WIFRXtI8ToqlnVq++O71spp9wrHXUEqs=
X-Google-Smtp-Source: AA0mqf6+GACnFv7dkky0qVX2+Wib1yT2HKORJaJkTf4fU8HCrF+ZffGDNNolX+oydNmx3Xrm5XsvY3PMY0UChOxLc1I=
X-Received: by 2002:a17:906:824e:b0:7ae:77ef:d048 with SMTP id
 f14-20020a170906824e00b007ae77efd048mr9070417ejx.740.1668389534685; Sun, 13
 Nov 2022 17:32:14 -0800 (PST)
MIME-Version: 1.0
Sender: khwajasalman03@gmail.com
Received: by 2002:a17:906:60c8:b0:770:af02:b99a with HTTP; Sun, 13 Nov 2022
 17:32:13 -0800 (PST)
From:   "Mrs.Yu  Ging" <yuging9567@gmail.com>
Date:   Mon, 14 Nov 2022 01:32:13 +0000
X-Google-Sender-Auth: vS0z2V14QX6ZGzINSc8HbglTGjo
Message-ID: <CAPvpH87Kr8N0V69Wa7C-Y7vEUvWnBp8E5a6PMOB6E7wue0AmAQ@mail.gmail.com>
Subject: Hello Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.8 required=5.0 tests=BAYES_80,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,MILLION_USD,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:643 listed in]
        [list.dnswl.org]
        *  2.0 BAYES_80 BODY: Bayes spam probability is 80 to 95%
        *      [score: 0.9101]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [khwajasalman03[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [khwajasalman03[at]gmail.com]
        *  0.4 MILLION_USD BODY: Talks about millions of dollars
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.3 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I am Mrs Yu. Ging Yunnan, and i have Covid-19 and the doctor said I
will not survive it because all vaccines has been given to me but to
no avian, am a China

woman but I base here in France because am married here and I have no
child for my late husband and now am a widow.

My reason of communicating you is that i have $9.2million USD which
was deposited in BNP Paribas Bank here in France by my late husband
which am the next of

kin to and I want you to stand as the beneficiary for the claim now
that am about to end my race according to my doctor.

I will want you to use the fund to build an orphanage home in my name
there in your country, please kindly reply to this message urgently if
willing to handle this project.

Mrs Yu. Ging Yunnan.
