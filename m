Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACCFA53AD77
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jun 2022 21:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbiFATbQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 Jun 2022 15:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiFATbK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 1 Jun 2022 15:31:10 -0400
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B789417CE71
        for <linux-omap@vger.kernel.org>; Wed,  1 Jun 2022 12:28:47 -0700 (PDT)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-d39f741ba0so3973242fac.13
        for <linux-omap@vger.kernel.org>; Wed, 01 Jun 2022 12:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=Gk4nfCem3ECRa7Gml0J0mN/3RZoOAdfGaQAqyHPKtiI=;
        b=DxxMd4k8tG1Z+DI+JxuL9225Cp+S+uInl/poXMcuMZiTQV1c8XJNPCuJB0EN9Fm1lJ
         tjqO15tZbiRtkiZc869kqZb+gTGwGsofr4Ks/EzA24HoqZkeukApCRLbeWaJgYbzN6Uj
         DJcyUaN0vgzLiaJiK8SKJwd17XWuJUN7X4OrSO+zy2q+txFdEpb8ifoCAb/ECnGeqxQV
         22+OgKU21rrXICCeKXN25GVJHEIOuX810V30PW3f8Y111fShlwSlQkBARV9N87g0aoLJ
         wQNCoaF08Ng768jLDvSBCHYHS21HkQkWfLc+tM30B/O2SgLendb0dLrFE3BY6UlGqUm0
         gBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to;
        bh=Gk4nfCem3ECRa7Gml0J0mN/3RZoOAdfGaQAqyHPKtiI=;
        b=q5GyR3eS31uuusitGs8rguRxHVJ85RdI/AE4UYAo32FnaqGX2oyBwrbr+8DWYs1IgV
         RWt6NzsDIxUI7vL/tkPVa8fvkhInrtnlvr90uonoTs9WcN1pXRQPV4CGcgpXpDMVGLck
         8YRGPmtXq2AlhXUTMBKwBqpp/Tkj5rEGzDDfR3/+wIeUb/CS4l0RZRgysyG/PyGeZVgU
         NXoX98iJIWhS/+cqAw5jvCrV8M1AHuA8HokXrGf6ZhZUeAzaGv08bGlJ7ZDtS8SS2hVX
         u1yJIMpB8c4+EBFOv6PT9dN5MnB6cWCx2U4+gyzzO/w8ozrr1rPJMgpt628ZCjrTbPxp
         JgiA==
X-Gm-Message-State: AOAM530vvKRFVFDlsnrgUpWzg9XPJWfj/AtEab8RRmQy7GY2Zc93SikJ
        4aDPFfjnbqi+SlVU3K9jqnV1xY1MJWEEy+kb5NMUn4Mpn90=
X-Google-Smtp-Source: ABdhPJxRHJ7PowqzwP8FVf7Pao2siL9+mp8F+vsKwg9Hvlld1uXwEH8+vzJyu5zLQk9d57eu+g6BtXkHW1P4ce0P3TA=
X-Received: by 2002:a05:6870:4619:b0:f1:e78d:fd54 with SMTP id
 z25-20020a056870461900b000f1e78dfd54mr18175523oao.195.1654111088174; Wed, 01
 Jun 2022 12:18:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:3601:b0:a3:2139:251d with HTTP; Wed, 1 Jun 2022
 12:18:07 -0700 (PDT)
Reply-To: johnwinery@online.ee
In-Reply-To: <CAFqHCSSUC0MpbjYK8d-GCxOG4b6Qbk2uH3+xQDZte6cPBsxLGA@mail.gmail.com>
References: <CAFqHCSSUC0MpbjYK8d-GCxOG4b6Qbk2uH3+xQDZte6cPBsxLGA@mail.gmail.com>
From:   johnwinery <alicejohnson8974@gmail.com>
Date:   Wed, 1 Jun 2022 12:18:07 -0700
Message-ID: <CAFqHCSTLW5uHwBqcyU-qn7_jF2jtwt2-CjgdN8-B9nAn9yi+vg@mail.gmail.com>
Subject: Re:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Greeting ,I had written an earlier mail to you but without response
