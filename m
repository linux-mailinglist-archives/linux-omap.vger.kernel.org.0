Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAA006726DF
	for <lists+linux-omap@lfdr.de>; Wed, 18 Jan 2023 19:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbjARS2s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Jan 2023 13:28:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbjARS2r (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 18 Jan 2023 13:28:47 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3400BA9
        for <linux-omap@vger.kernel.org>; Wed, 18 Jan 2023 10:28:47 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id tz11so20965467ejc.0
        for <linux-omap@vger.kernel.org>; Wed, 18 Jan 2023 10:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28ktjE1NMsXfKN9t4WPAwEL52FnPF3RT3R2lcaspUbo=;
        b=nyBnkdzF5rrxmsolDjjTPJ6FzXe+z++bo5X327QrDi7PTrpDYk7QsOxjMqYgsPg6qe
         AMDaR6MjwH9HNXWuR6pN0YbgscAuJiqDeVwP0TLp2BHZ+9Ak32FqV9oL82jgngmyFnrm
         NlT5MTM5xmBbesUyBxRqfAye8tUzX7xGKyDRCsRB06wrXDyyWqnFDhB7gn/YXGUnOt3t
         BUPsTDPB7bkCl8EDYD1hZ9BnLr6UA+67ASjMEmEfInXTrlznq2mMVo3aeR8w5eZMFacj
         N4X820gUP5qn+lPLx7nYttYAUiyEos+vE45UKJi/ID7qMKU2vdPyw1FLpLVbwVHDBi1K
         Jdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=28ktjE1NMsXfKN9t4WPAwEL52FnPF3RT3R2lcaspUbo=;
        b=IVHas9X5HGY/PWh4GdERSXf/b5e1lhi0E4yxdA8Oisc1w3OVfRyrpaiqrCrkUQR82w
         Y9Y4UX5TFbpaa5CBSYtc0CpIjccHkNksYJkr/EQwqV1T02JmMWfJKynbUzxkAKZaopq5
         L1XZlQAn0x1lgpIrXNQdAZKAP7T9BEJy7f+DNNvFPfapkUT247qrBAtJCJxlw6CDcbGQ
         FIRyhSSqopN/N8RNkIFpeLQVfO+vIc19x1u+9sCVoVuatNmvGhrt7ozInMxnvYw6MkpB
         A3PYWA2MvZO6xirwd9Yqm+FQ5frdttSHXGWbtz7fU07sDqLqkkTM8NK7NX6WcSCe8aZs
         bW9Q==
X-Gm-Message-State: AFqh2kqv8vD70aWNm8fWKIFcz/Oyz4qPHNVS6JhjKzJ1HXNXJYUypPi4
        3avxvK51FU3MRLHR85NNm7aV9XYBAUKMqRMi9b0=
X-Google-Smtp-Source: AMrXdXtQfBYD410QuCsoup8Fi25SWMDqa4/urtFWddjem8koMOfw1pHlTiCeoKA8nZ71cQ4iEupAnb+RtbJCFTi7zDQ=
X-Received: by 2002:a17:906:a20c:b0:7c1:5ff0:6cc2 with SMTP id
 r12-20020a170906a20c00b007c15ff06cc2mr652852ejy.246.1674066525737; Wed, 18
 Jan 2023 10:28:45 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7208:70cd:b0:61:435b:38ac with HTTP; Wed, 18 Jan 2023
 10:28:45 -0800 (PST)
Reply-To: fionahill.usa@outlook.com
From:   Fiona Hill <ekon9169@gmail.com>
Date:   Wed, 18 Jan 2023 10:28:45 -0800
Message-ID: <CAH8kvD336c6JxwqOXiFqeHMK=_uVOHWxrdhmMoSYne+k-37+zA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

-- 
 Hello  did you receive my message?
