Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 682FB56B9BF
	for <lists+linux-omap@lfdr.de>; Fri,  8 Jul 2022 14:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237944AbiGHMe0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Jul 2022 08:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237735AbiGHMeZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 Jul 2022 08:34:25 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A0574791
        for <linux-omap@vger.kernel.org>; Fri,  8 Jul 2022 05:34:24 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id b11so122525eju.10
        for <linux-omap@vger.kernel.org>; Fri, 08 Jul 2022 05:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=MUDd76TinUcA5JyTPJBAHn1VumWVzYjA1fKwU0h/HzI=;
        b=MudJ76ZdDei8iWMYfleaHmDCgOF3GPyaZqFDV74GoGQou+Q1YUwaTk2K+Jb/On8FTV
         skNXzqAaZ5OT8By6ZPYGpyclifdhuZ8jAsoUjLlSHif43M2eN94NM+NtM3sOZ2dXcCKp
         HT1UaXF8dLH5OsrhXn88AzUS9O0qD4CpUyaK22eEvjm5MvP3h+VuW2jeJkTVvgxycRYe
         L3tyiTlyr3hFOI3dxYDiB2vLeSQyNdh8mKEyYpaCcx0olhiJerbE5xLxXfivz2MXAE8d
         kth+Ocidq8Y0wOJM3Lk587FiMmYwUfwDKvEBmSGVENbzGOxw3lqLtLKZfk4Ph3y0fAdr
         zMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=MUDd76TinUcA5JyTPJBAHn1VumWVzYjA1fKwU0h/HzI=;
        b=aX2UZIjoLnJviCV3VIJ87Cxu9F63PyqTNVNrd2i31dUqQZWbswhxdv/QBTuUbIiVz0
         FZwxBvAOGm9PR2XOaCK66+xdepVML1tP57GxlrTQOJPe2ViA5BmdIhmS2EN+szmOPZO0
         tFBkAanQihcDQpkT9zcauNhHYv+tQ2JjEAPLiFl3du21zxgaNz8+AqWYA478lWmnkzt0
         hwR8yrVpantctn8PufiN4ksrQqICezad8nDne+qsiepZTOZJ5bzz6AtqRe4A1LLxql/2
         UO3MKILGZWVHf90GuXiq2scKOCf0in+HZ6iPtLUiEU8XPPmCh3y9okVMPfAfZ4bk1mVD
         YjUA==
X-Gm-Message-State: AJIora+SVhV58Z4O3SVGaObG2wqgdJOwdX1Yp4KgEDnd2smCi5I1rxS5
        tyX3Xho9aeVlvcfVCTvQvzcCPNnOAxUXn2Qbn54=
X-Google-Smtp-Source: AGRyM1u8k/L2Uu3tdP6yNFIuuco9kAZJRYTuGDE1Qe2kj9/wmAJz+PXjbH8UauuQSBfeScFAorYTt3W63yQ2nYQQPzU=
X-Received: by 2002:a17:906:c10:b0:6f4:6c70:b00f with SMTP id
 s16-20020a1709060c1000b006f46c70b00fmr3449939ejf.660.1657283663065; Fri, 08
 Jul 2022 05:34:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6f02:438e:b0:20:fe1:b462 with HTTP; Fri, 8 Jul 2022
 05:34:22 -0700 (PDT)
Reply-To: marykayashsmm@gmail.com
From:   Mary Kayash <gregorydresing@gmail.com>
Date:   Fri, 8 Jul 2022 07:34:22 -0500
Message-ID: <CAN_rwTgGFKxPgQ_4wTbCd_Dmj3Vd1--MYhoFxQg51+1aOOhpcg@mail.gmail.com>
Subject: Dear In Christ,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Please I want to know if the email is valid to reach you.

Mrs Mary.
