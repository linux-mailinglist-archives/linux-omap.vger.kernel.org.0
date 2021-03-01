Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 953D13280EB
	for <lists+linux-omap@lfdr.de>; Mon,  1 Mar 2021 15:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236387AbhCAOcA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 1 Mar 2021 09:32:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236137AbhCAObh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 1 Mar 2021 09:31:37 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C7FFC061756
        for <linux-omap@vger.kernel.org>; Mon,  1 Mar 2021 06:30:53 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id q23so19631845lji.8
        for <linux-omap@vger.kernel.org>; Mon, 01 Mar 2021 06:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=RzR5AaaqNsE2sW8oJHHVzOmOCqvuSToIkWNbs/VHkBw=;
        b=pYD4wjmB+VigVjOTJXpyxhcVe+F7zwPaF/u0sts0kNByR3rer7HlcTwKIKKKtSBZea
         QzylmAyBT/boO0Sq4QJWcvEaZOM8HxF16zql10AWzY8CyALq31BUY0MvGONB5AyftDaX
         zDMyUCGccVIJWE1IIDHzf3172dLeISFU/ChvozqNGvVMcVQCA+6Mpwb3/dmQO2zOhbYo
         gXxnG7Nty4urciPgO1oCiVbeen+OFlsY9sItXodlm9d/rYs7eR4NFHfzLjT+Ot/QWC5z
         s59o7ZN+aj9PEF31Y4swZBjqdQXN0vGpYH/D3+ycq2XjdTUHeSDbx4Z3TOZ5mAD6cIh3
         nIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=RzR5AaaqNsE2sW8oJHHVzOmOCqvuSToIkWNbs/VHkBw=;
        b=RgtrvNULfKtovRD4HnX6jCim52fHvK7C00uOrszM9KBeLIWbJY0iAQpBejxsa+90Nt
         tpATmqLKXH4hgXAZMc1U22+Rkn5ZT6sB/6GihW/tYDQILKkhktZYNC5EPd9HUXbkxjSg
         6BLYffuEiSpWAJHI1vld+xDlMtFIEFKSOGOFM/mzrwAaoEDckqWi4glXhR4LyFPcrsF9
         ngrsqDfYp3bRqHi+p+MekbN1KESlULOFGUqJN9XrneicXcoeDaMvjEs3k2M41u4S2ltM
         r+T3/DxvPCBO9523B52BA+fDUd+7m6azVaRieiZddfT5T5YEo8Sql2gN4GzWiNtyWWXL
         bUQw==
X-Gm-Message-State: AOAM532NeBZIQ/NUYwydtpJO07ov5Ij5vXc0/phm49/VwfH2JLi8C3Rf
        9tNSlRR1jKfKtPKQC4qw52N7+S3UIdBprbLliJrO5/L+eepfow==
X-Google-Smtp-Source: ABdhPJxyc+JWXnvx0W0GH83i4zV+OrHLXHdWfE0Wr8HOkO5Tt2bNlLwHMJA3JmTiCRIAa9TI/yBczesXbH3NNpYTW1Q=
X-Received: by 2002:a2e:9347:: with SMTP id m7mr6853314ljh.366.1614609051740;
 Mon, 01 Mar 2021 06:30:51 -0800 (PST)
MIME-Version: 1.0
From:   =?UTF-8?B?16LXldee16gg15zXldeZ158=?= <omerlle@gmail.com>
Date:   Mon, 1 Mar 2021 16:30:40 +0200
Message-ID: <CAH-0sm+e+96u-nHiKXDOw8zjOOa9hJcKbq1tUp79oj5e26YdJQ@mail.gmail.com>
Subject: ARM: omap4-droid4 - using headphone while voice calls
To:     linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Does anyone know how to config the Droid 4 to work with headphones
during a phone call ?
omer
