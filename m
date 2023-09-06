Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAB61796DBB
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 01:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245003AbjIFXtk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Sep 2023 19:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244988AbjIFXtj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 6 Sep 2023 19:49:39 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FAB61BD2;
        Wed,  6 Sep 2023 16:49:19 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-271914b8aa4so286625a91.1;
        Wed, 06 Sep 2023 16:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694044159; x=1694648959; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pMprcsF/w05ofZ2dhMr2I/QYh1PPq3C9aqSR8/FhUVw=;
        b=LDO5mJTqGJGKvS9GdPiI5SZFkQn9HSPNCexTPRQnW0XYW5CmfBsCEMHVlEamRK3VOT
         2MAEJYfenGAc5Pdb8xmIqFxC3lDjqfMNunYBFltJPirrHj/9DkNUHZpucqQX0m39XFe5
         NljTyL6FL5iZXF0CUyyzHiDqGuhGHpb90XnFtpkUiN1NN5R9b4nXjcEDAdYS6g3pqgHm
         27QsAJvT0sGbOsHNkLU9aIF86q/UyAQmEgxMMVpjZZ8DD72OfGTH+vkkjPbdtWtiMwag
         EfkM/hWAiuhaMsM/mpXsG93Bxv5R49sLXbldJlPm+PpiIik8GttGchAbwPGVEGJHq15F
         hR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694044159; x=1694648959;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pMprcsF/w05ofZ2dhMr2I/QYh1PPq3C9aqSR8/FhUVw=;
        b=BTu7EZXN2ETxnNczeDcW1JIL1lnz6UxTxG+7OQ8xTKnx/8VejGdzp53p3+WQ2+QPHB
         ZXmxJbhpFsQynhPGmZTSFr36QlVs2HvnIEnZFeuFY/cY0wJdIucpgSahjSlm1Gi0Y1aE
         4VVo1pbX+qKEiDaZl+awEhUP/GAMjFrkgDp3fjhy9hGKLBbKCaeiZuu67d0fdRsYQlj2
         rcQlhtj1Wtok0GUzn/Wr1NCwiNWpcyM6Pyb+Tvptu+GQdHDgSpDYaEHazIaJ55Uh9tic
         jh/s/pCZ5VHv9QkxwKBBIaqSpi7jvHH780YlVMmmAhRb3a5jCs7a5wRv+VGA+YT1ay20
         L4Tg==
X-Gm-Message-State: AOJu0Yw4ZiI9J+vgSorVIEIXkolq4/6KrrCRsvQhu97oUoc6XqSyuHzw
        gcKUkHS4J9MRO73ONzTIhjgYxSjuQyJ7X2wG13Osn1wNu5o=
X-Google-Smtp-Source: AGHT+IFodavs1CDtQlfvRud2q8DQ5YoN2U9ZtTpqMZ6+1rz+m0J9Q0IqHAfvCCVJ3GqFFojwPwo22ThxDS+IRx3FmmU=
X-Received: by 2002:a17:90a:a58f:b0:267:7743:9857 with SMTP id
 b15-20020a17090aa58f00b0026777439857mr15232997pjq.17.1694044158600; Wed, 06
 Sep 2023 16:49:18 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 6 Sep 2023 18:49:07 -0500
Message-ID: <CAHCN7x+GLhYyEMq0h0Sa3m9JMuZf0g7=FpT==uFOg=w7OQ=qUw@mail.gmail.com>
Subject: of: property: Simplify of_link_to_phandle()
To:     stable <stable@vger.kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Stable Group,

Please apply commit 4a032827daa8 ("of: property: Simplify of_link_to_phandle()")
to the 6.1.y stable branch.  It was originally part of a series that
was only partially applied to 6.1.  Being partially applied left 6.1.y
in a state where a bunch of peripherals were deferred indefinitely on
the am3517-evm.

wl12xx_buf platform: supplier 48002000.scm not ready
wl12xx_vmmc2 platform: supplier wl12xx_buf not ready
48050000.dss platform: supplier display@0 not ready
48064800.ehci platform: supplier hsusb1_phy not ready
backlight platform: supplier 48002000.scm not ready
display@0 platform: supplier backlight not ready
dmtimer-pwm@11 platform: supplier 48002000.scm not ready
hsusb1_phy platform: supplier 48002000.scm not ready
gpio-leds platform: supplier 48002000.scm not ready
480b4000.mmc platform: supplier wl12xx_vmmc2 not ready

With the above commit applied, it appears to address most of the
deferred peripherals.

Fixes: eaf9b5612a47 ("driver core: fw_devlink: Don't purge child
fwnode's consumer links")
Signed-off-by:  Adam Ford <aford173@gmail.com>
