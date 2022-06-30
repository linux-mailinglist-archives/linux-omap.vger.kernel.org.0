Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCA8561FAB
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jun 2022 17:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236187AbiF3PsP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Jun 2022 11:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236169AbiF3PsI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Jun 2022 11:48:08 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32C5EEA9
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 08:48:06 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id k7so3445901wrc.12
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 08:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=Ai00vPmyKSILizlPtVY1TtxSHqjk+hDntQpOGH0MO4c=;
        b=kAaZfWS5Qqe4NFtcOj2PnYFBpVUzku4B5UQse9m1BbrexRmI/zyP5WY3ns4oU4vb+E
         x1IJzCvXkK9+qS2HFYq3hSbk2izHmjw0zGJXu4O5vd0npl2zD49Uz4ZygdwDFocs7rjp
         ICzaAZlvhOhAUCca2MoHEssJt07tWw0+RjXOW9x7L4hfLbyq1/FksQrOZna0CqHpmNLd
         O1xilPXJSA1Yc6SM/VA6To53RHlLVJf5USolbIGtW+RxVfWkyTpyoJD9MjF+7W38S6tz
         FmdJ5QmIEEbcd4zgMYMr+tUSsbkrdwrAzvjG9neWmHCKftv3X1Z3aKrg5zs2QoJEx1iT
         gA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=Ai00vPmyKSILizlPtVY1TtxSHqjk+hDntQpOGH0MO4c=;
        b=cWCb/+WMddBx+1fcOl6YCLHOrTMF0aAv3QV1yqJgvSJ9DhR9AmA1D1HUXRON15PdaH
         H185LIQjQ3GIbEerJ+zGu+y2eRkue9NzYQckojWRTq0RKX7AWYZPnP7NwJoSmsGVdMbm
         k5jmZcv3+THzhwOk3ib4TEFikg7y2iORUE7GH68mdHatX6i1PjtekOaG0OPfBPLphnM+
         8ewNMwhxXLu3AUf04o4aPoGv6p5iGSkWmom/jwP+nZVKb5MYciE7mfCf6lWWHOFnbxxg
         IgnBH+CmV3cPb4YrBtpMXu+JBh0YBljQTZ2UuFhoTVaTEF8DrvtTo48wmOfZ1Hk4RVNE
         2q9w==
X-Gm-Message-State: AJIora/dsqNJrsh3eweoqxFXw+rSy37/Nx7jAj4Fkbq/sDM2pXGbaCw2
        d76i0E/hvN9qjcY7zp3Zw6gRE9tS37o=
X-Google-Smtp-Source: AGRyM1tMovOsTMFyKXdTGoPYRs2HPSelbidNxYMSrkPUja2NQCdy+aEkPsued082uSQN9xEyjXmrkw==
X-Received: by 2002:adf:f10f:0:b0:21b:8f54:722c with SMTP id r15-20020adff10f000000b0021b8f54722cmr9112903wro.401.1656604084459;
        Thu, 30 Jun 2022 08:48:04 -0700 (PDT)
Received: from DESKTOP-L1U6HLH ([39.53.244.205])
        by smtp.gmail.com with ESMTPSA id o9-20020a05600c510900b003a02c21b7easm7325026wms.11.2022.06.30.08.48.03
        for <linux-omap@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 30 Jun 2022 08:48:04 -0700 (PDT)
Message-ID: <62bdc5b4.1c69fb81.a4393.0618@mx.google.com>
Date:   Thu, 30 Jun 2022 08:48:04 -0700 (PDT)
X-Google-Original-Date: 30 Jun 2022 11:48:05 -0400
MIME-Version: 1.0
From:   emmitt.dreamlandestimation@gmail.com
To:     linux-omap@vger.kernel.org
Subject: Estimating Services
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,=0D=0A=0D=0AWe provide estimation & quantities takeoff service=
s. We are providing 98-100 accuracy in our estimates and take-off=
s. Please tell us if you need any estimating services regarding y=
our projects.=0D=0A=0D=0ASend over the plans and mention the exac=
t scope of work and shortly we will get back with a proposal on w=
hich our charges and turnaround time will be mentioned=0D=0A=0D=0A=
You may ask for sample estimates and take-offs. Thanks.=0D=0A=0D=0A=
Kind Regards=0D=0AEmmitt Nagle=0D=0ADreamland Estimation, LLC

