Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7186411AD1F
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 15:13:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729513AbfLKON4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 09:13:56 -0500
Received: from mail-ed1-f46.google.com ([209.85.208.46]:41697 "EHLO
        mail-ed1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727554AbfLKON4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Dec 2019 09:13:56 -0500
Received: by mail-ed1-f46.google.com with SMTP id c26so19507151eds.8
        for <linux-omap@vger.kernel.org>; Wed, 11 Dec 2019 06:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=gc7EFmgbjQ1RA9H25U93SZyl8HTMYpwnN8/k8P9Xxh8=;
        b=IE73cy6e0QBiXaBiPeG6am4cpUlV1LgNqC6XVEKYxBbMhxUuQJZy2yvOAinDK9kYw5
         Eu0nXncRscA1qF8E0h5zQiyRS/6TpURaTWauWN0XKQmgwT4mFSPEfYlEe9t1lwHODBQr
         qFEsA8+kq53F3PBGAJHUH4h6Pm6O/YVB7F/QIaJjI3iq7ZuXPieTno7f+aD70WPMC61P
         RGaZEpSQaRcRtiXMCtHDlxvn6B2jEwBtBTGYx+YfgptMNTaySavGtRnZc2qI2l8Cy2l1
         HRB5ofXf7oaAjwOTySX+UrFrSuISurq40hnCJUmfucIHDfhF36G+DuFbC7NHIhF8Vq5Y
         wBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=gc7EFmgbjQ1RA9H25U93SZyl8HTMYpwnN8/k8P9Xxh8=;
        b=fFcDmf5CXdEyu5poCoDMQabQakIF5iTnjVHAbgdCo8wZQTwPOXbd+WZSqutsZ+3EIt
         JVUIULTwlpeD7NhZwvHTkCO0HdoJSWY5Qse7ix0ztT38N3sebt83goKwoAMK3mMK5flQ
         F8LjYV061kQVvrRR8L2EaD1qjuOdhQ1W9iiM+0KtH6g5cBo1oq0hThZ+tRkepLt81t2M
         dKr9XEScUMZ93+uVXYoKcqnJQYsTm2KjPDWDmubcVcIRWNpvYGpkGv2oBMJ6yDzRJyfv
         WH8aGz+qWVjne0y0t7U8rv7PU/Z0ruz3e0f74B/R7JetdN9DXAE6HOnMG7WAXh/iCFPt
         9Z1A==
X-Gm-Message-State: APjAAAU4Z6H8oXEbc3qh0xrNbKaxGNlk/h8VKsXW2gpPGh6wFJpYBO8v
        IaxngUspNh2TBAGsrtVhPaAFCmvA1V9y1s+dSFQ6iAj7
X-Google-Smtp-Source: APXvYqzr4WFC3Q1OruYFVGDpxs97JDNVAQTuWzJPl1nJe9HZ4KmYwSTh82s/rjf+2kkfcBJiOP5fGwJkMIXE+DWSoT8=
X-Received: by 2002:a05:6402:308f:: with SMTP id de15mr3446550edb.69.1576073633943;
 Wed, 11 Dec 2019 06:13:53 -0800 (PST)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 11 Dec 2019 08:13:44 -0600
Message-ID: <CAHCN7xJa3D15b1WGznTMk6Nt4OPC77bnPUyri6knAdJw4D_uHw@mail.gmail.com>
Subject: WL12/WL18 SDIO Regulator Question
To:     Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I am not sure where to post this, but a bunch of omap boards uses
either the WL12 or WL18xx Wireless chips, and I have a generic
question regarding the 'regulators' we use to set the enable pin on
the WiFi chips.

When digging around in the mmc drivers, I found a driver called
"mmc-pwrseq-simple"

It appears to do exactly what we want (ie, turn on the WiFi chip)
without having to create a separate fixed regulator, but it also has
the added functionality of enabling an external clock signal.

This mmc-pwrseq-simple driver appears to be referenced from the MMC
level with the reference like "mmc-pwrseq = <&usdhc1_pwrseq>;" or
something similar.

Should we use this type of mechanism instead of the simple regulators
to enable/disable the WL12 and/or WL18xx chips?  I am not sure of the
OMAP MMC/SD controller utilizes the "mmc-pwrseq" entry in the node or
not.

adam
