Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F302950ACD4
	for <lists+linux-omap@lfdr.de>; Fri, 22 Apr 2022 02:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442957AbiDVAio (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Apr 2022 20:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbiDVAin (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 Apr 2022 20:38:43 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF1403F8A1
        for <linux-omap@vger.kernel.org>; Thu, 21 Apr 2022 17:35:52 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id bq30so11531648lfb.3
        for <linux-omap@vger.kernel.org>; Thu, 21 Apr 2022 17:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=nQx+t9YN/f6yN9hN6yvBlZ2Shg32fit7rX65wdwqT4E=;
        b=lmMGbLw5zTbjrcxjoaIpKGXPhKXCZqlLyu5T0Ge5Lqrysu45107r/xKKu6eM1gaqO+
         PBoKkXPOyw2jm+CFFLev5yf0IHN5XxXSqF/1Gaz/zn/6USgwqiYOZh9Q9ACL+ku4q4pD
         DZAKyZF5PkIQ2JoD8Cyu4sTHq0GnJd3zTAE3bHgVAjBO+We9GsYwpwTy3/HOWZlHU88E
         ukReDwH4QztM23EDCc8xPKQf3N/MlzTlGwFHq0OYdk330/Qca0lrHcluGK0enzt9ugh2
         38Nl3jLAscwwVgJ6NFGmP2sNPW7UyK6kDjzziY4lNMpmNrNIB9S/jYkogUS4jPf9Tu5h
         IbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=nQx+t9YN/f6yN9hN6yvBlZ2Shg32fit7rX65wdwqT4E=;
        b=RraUgQQWptZqH/KjNAgx9BGqvUI0GRUx+gbwOqHUcJtP6dBXW8R2AO37RMjmZadmfz
         mAmK+YH3bHv9WYp01/VCSLS7VU7rwYA18VmmPvsn+6psqQM+EBKZxFu5EWGDks/Fqy28
         S3ZawfWNQrw5IUNPwEnm/IAkTu8rvapkD32blert+maGaM2IDFq0fF2t+1bfC+3M8jMT
         yffZJucuC1Dit1fQjQg4a0Xzg2iKiTBj2MuRhDyN8WpMI6uUDsKmLjiUKzXgfFATMbbF
         Nbhay9OZYUQBv4uL4KI7UZwj0cYtRLOWdosRl1BK7GmCpPxhqEWg/lJazXVRCG56gizB
         aclA==
X-Gm-Message-State: AOAM532DkRUWQt0CJLi6+/JVCKCo9SpGqEn3/Ey9pvU4by6lpw6rwdt5
        caDBk0GVGxujyp2Q1vnA68zTvw6f0TW8Z0beCg==
X-Google-Smtp-Source: ABdhPJwnXFFQuYUudpDIgZyRvDEkBR47LbGKBV30sSs5jHPJqtBxKc+bxjEnqUBT4hF1nKS3FePk7WpBvjZG3WRXnfI=
X-Received: by 2002:ac2:4649:0:b0:46d:f73:777b with SMTP id
 s9-20020ac24649000000b0046d0f73777bmr1245387lfo.595.1650587750823; Thu, 21
 Apr 2022 17:35:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6520:352:b0:1b9:cd9e:36e with HTTP; Thu, 21 Apr 2022
 17:35:50 -0700 (PDT)
Reply-To: hector@cgglazing.com
From:   "/" <ubank2022@gmail.com>
Date:   Fri, 22 Apr 2022 01:35:50 +0100
Message-ID: <CAHGAj5ZKfxnTntC2u-xW7QMbGriv0Yc00Zh0nFa8j0Jw-+zkag@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_FILL_THIS_FORM_SHORT,UNDISC_MONEY,URG_BIZ autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This is Philip Twite reaching you from the United Kingdom
further to my previous email notice. I have not received your response
till this date.
Kindly forward to me the required information to engender further discuss.
Information should include; your full names, address and telephone number.
Urgent response solicited.
Kind regards,
Philip Twite
-- 
///
