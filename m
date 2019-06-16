Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 649DA476C1
	for <lists+linux-omap@lfdr.de>; Sun, 16 Jun 2019 22:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbfFPUe2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 16 Jun 2019 16:34:28 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:40489 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbfFPUe2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 16 Jun 2019 16:34:28 -0400
Received: by mail-io1-f66.google.com with SMTP id n5so16837330ioc.7
        for <linux-omap@vger.kernel.org>; Sun, 16 Jun 2019 13:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J/Rl9KPoyNh+eRPhLhJfKs2yvVQamk3ksTPb5HC2+lQ=;
        b=tt+9LhrJeVw9iwuMWDcMch2hUfHcEfBnmTnxQuVTfQF2+JCYbyvJS+f7CxMs4M8+L/
         oA1KsLKvM2owpjEEUwUEnK6pJVUlqTk6ikywC0Ex2ySwXsai/rfkxFufDnTPZHZzHvEi
         3a1JI4tMmfSXBOv5meOaFhJQyQ4S3U03nwp04kukC7DTAW6oGUse8OcS0maiCEnmALex
         PdWLBKFv2JYgpnVPNlPWNuGEiHEx1wnwm3ooOmjW48SlbViiQbTe+5/7/QbJGjG5HMI/
         klGRgqdbujwlgqIT0IW0h9s2OgJRqdDFZMCooGapXvBcawYRCR5G4sSTG9vIeVdxprpa
         DleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J/Rl9KPoyNh+eRPhLhJfKs2yvVQamk3ksTPb5HC2+lQ=;
        b=o/zv5aIpKphlGxB42bOebAGokw4Yfti3NtUW5ndQTJXFjw0UUIVac2teBi9KGYw0R3
         dtm6+nwpxmPn5/mYNZ4FvVyumIH1bQFna7dJMLPPsnjy/pOsqQKywi/a+KjcrFh5/KjP
         +t886J48Ck0PGGsBys87kIoU7azX5OTIwooXWvnAZGkFxGrhvBpQWK+7Nn/WLn8GOeLE
         eJg/eqHd3/39CP6rvQ/PQRAeRUA/fP1phZQLgY33nOi+StQCaSv87f+/gNu4U7c8nuE1
         rDa/fW5diIkxyrzDlB8DC6D6uRkkMsc1QANdT09jz79SqwLYh4YHDDTi9BHdgKL31T40
         TuyA==
X-Gm-Message-State: APjAAAVL2naAfKpqmsa4o23WB1V+yvbg7x65qZ5NR/FAZw9F+HLmzbO+
        1uaXFbZZKlPxrnuo+GL1VahsfASqnrjCS6/OfVUoyM5z
X-Google-Smtp-Source: APXvYqwZ5Rh1DNl+xYvGHFsN37yH2C60kNHih01DnvUD2q8UFoCzBHM3uvpvj2P3Rg/noeJmVYctfdufOyGc8EzpBcA=
X-Received: by 2002:a5d:8347:: with SMTP id q7mr12895821ior.277.1560717267609;
 Sun, 16 Jun 2019 13:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <pull-1560323885-602179@atomide.com>
In-Reply-To: <pull-1560323885-602179@atomide.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Sun, 16 Jun 2019 13:34:16 -0700
Message-ID: <CAOesGMiRi4G1eW-v8X-s5YQbxN-iGOzpX_psGfNMdW2MD0PT9A@mail.gmail.com>
Subject: Re: [GIT PULL] three fixes for omaps
To:     Tony Lindgren <tony@atomide.com>
Cc:     ARM-SoC Maintainers <arm@kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Jun 12, 2019 at 12:18 AM Tony Lindgren <tony@atomide.com> wrote:
>
> From: "Tony Lindgren" <tony@atomide.com>
>
> The following changes since commit 4ee23cd76c0ce8622976b3da0e2bc89e6d94f6d4:
>
>   Merge branch 'omap-for-v5.2/ti-sysc' into fixes (2019-05-20 08:33:03 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.2/fixes-rc4
>
> for you to fetch changes up to 8a0098c05a272c9a68f6885e09755755b612459c:
>
>   ARM: dts: am335x phytec boards: Fix cd-gpios active level (2019-06-10 00:06:57 -0700)


Merged, thanks!


-Olof
