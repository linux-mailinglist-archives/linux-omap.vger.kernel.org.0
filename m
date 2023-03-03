Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A76FB6A9ED1
	for <lists+linux-omap@lfdr.de>; Fri,  3 Mar 2023 19:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbjCCSaH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 3 Mar 2023 13:30:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231907AbjCCSaD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 3 Mar 2023 13:30:03 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B364E14E82;
        Fri,  3 Mar 2023 10:29:38 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id a25so14170104edb.0;
        Fri, 03 Mar 2023 10:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677868177;
        h=content-transfer-encoding:to:subject:content-language:reply-to
         :user-agent:mime-version:date:message-id:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LaOTBtKMwRZiDcFQS8k/nw3O839PhUwgA/MLGTdCM4Q=;
        b=kFCKDKeI00C0MnL/ZvtPnp37KCcrBC8+u3rpZ6b1/69GOQ5Ai3rMN/jMuIo8w6ErxT
         CzoldPjVdgdhjy8BWwjDbJYF/ZxwrEb3hf4H/pFcAEKufWy2beasZik9XysEbd8mpGBz
         jHc6HHTDlx3eASuY1FWSdKibJ8rgVbEAkYWqt69LMRUBkVgMMwyXLeFo7KDKOh8KxsbO
         8N3ZqtMPfUZRt7CW0YOghwzVidN+N9NaCQ0DRoTO2DyE+b9rfQalpHG7phifJw2/YSwF
         OgcH1EPBEw+MRzmVc7FOo6stj9thn95BigLs/ujQrSBKYC8n8pdJ9uX837zIKM7g6pwb
         EXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677868177;
        h=content-transfer-encoding:to:subject:content-language:reply-to
         :user-agent:mime-version:date:message-id:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LaOTBtKMwRZiDcFQS8k/nw3O839PhUwgA/MLGTdCM4Q=;
        b=pdWEjQn1fiHEzv/fRBuOB9hmcjZdXhyY4jk4rwADy3XQPofw3SBJzJhg0oucyJ9zGf
         1IMXrVwssPIc2PULhGPTuJmsrNXFLzjaib/LsrLrYENml6/9V6wAw+vI/Ow4wMlsAhML
         /VK2GD4vdwoJXDR5Xj6GMwgxztL5ViuvdPqex7Jq+qO3CcEx8bLeeHLb9lbd+7AMZE0T
         PCQ8rGnPufRVyyO37260r7Qsean/icJzbbnPlB9e2SCdVVmcfV72gqDmNOoP2epX8EY9
         fkaSM3yE43ZmDrptnyk5FaEMD6oBUgEl41sFiXOb9IV8XcW9oEhXFwEBMVlAIi2lCB5N
         4Wxg==
X-Gm-Message-State: AO0yUKW4bkquDuZB6cclzir5dwHq6djmdAeHZqIxNtsktimFSwPnc8w7
        D3I9HwyrXcU0h0U/iUoggA==
X-Google-Smtp-Source: AK7set96pZE90wxQDy/BWY9EJHlrcXyAJSEEl24h44XQkEbUqquYNv/XRhTz0YCeZtabNEnJ7tj52A==
X-Received: by 2002:a17:906:b88e:b0:88b:a30:25f0 with SMTP id hb14-20020a170906b88e00b0088b0a3025f0mr2736090ejb.32.1677868176687;
        Fri, 03 Mar 2023 10:29:36 -0800 (PST)
Received: from [14.2.2.97] ([196.171.80.178])
        by smtp.gmail.com with ESMTPSA id si9-20020a170906cec900b008c5075f5331sm1191545ejb.165.2023.03.03.10.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 10:29:36 -0800 (PST)
From:   Agbobada Beauga <adv.carlos.jude069@gmail.com>
X-Google-Original-From: Agbobada Beauga <adv.carlosjude069@googlemail.com>
Message-ID: <d58a499d-76dc-ce88-e063-a5d881f052a1@googlemail.com>
Date:   Fri, 3 Mar 2023 18:28:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: emailoffice151@gmail.com
Content-Language: en-US
Subject: Re:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: Yes, score=7.7 required=5.0 tests=BAYES_50,DEAR_FRIEND,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4818]
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:532 listed in]
        [list.dnswl.org]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [emailoffice151[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [adv.carlos.jude069[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [adv.carlos.jude069[at]gmail.com]
        *  2.6 DEAR_FRIEND BODY: Dear Friend? That's not very dear!
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Dear Friend,

With due humility; I sent you an email and there was no response, please
confirm to me that you did get this mail for more clarification.

Kind regards,
Yours in service.

