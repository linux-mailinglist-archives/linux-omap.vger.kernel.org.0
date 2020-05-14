Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 111F31D27EC
	for <lists+linux-omap@lfdr.de>; Thu, 14 May 2020 08:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725831AbgENGe5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 May 2020 02:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725818AbgENGe5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 May 2020 02:34:57 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0146FC061A0C
        for <linux-omap@vger.kernel.org>; Wed, 13 May 2020 23:34:56 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id g9so1430752edw.10
        for <linux-omap@vger.kernel.org>; Wed, 13 May 2020 23:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=/MMye/X9PtzjbzjkLnI+HCWJh94nFZbow1NZVYLNpws=;
        b=F5SO/9TkJ7QmWjuWRsasgkjxQLQCEnvWgw7gomlwNtpJ3i190Baw8R6o/P9tDLq5kX
         dX/FHXob48lTrsYfSeGuw47FPCwq/78hNjJRsC2BxYZFK4K/UBsYq6WM6WUEUPsAfdNe
         K2JUAx03NRpvVOxFHbALRJqLJewU8I9S4zd6jKF2UJ2i1MGuiSvA5jF/PAJOUljaNcg6
         Xve1TlxIDRXqLR2t3pSMiiAWoK1/NOOjXTiThNINwgMKOjMwLRg7l1xSePwFOoubLbFx
         cMU6gxtoqdmNG9lMNKeFM4ts7LF+eXcxWcli5MgPyMjo3aAcNhUdiMISW9y1aRiQvgza
         jHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=/MMye/X9PtzjbzjkLnI+HCWJh94nFZbow1NZVYLNpws=;
        b=K6QgDqJeEdrDe/lhohQSpVV7Rir5xP/FhnLOgTwfNIh4tL/Fj+SzhNg9jEoQfc5Nuv
         +xheIemFDNYgC42jws0uXdwlsaYlPmzQKac/KELAjJ76m69OtIhSUKDI1GWVLQQbgmD/
         Ut4EEp0ogAiOH8nmBR1Qx/l+FonBBGCNMDBUFRcVNCpoBJyFDMTzpzYRLoWnMHe2vucm
         IlEH/zq0EaGBR1MUu7amtqVUDXdwhjr1QGab/hty7yC/lyLrSXZugUcfiR8jbboFALBB
         wknohyH1GmdwK6AH9Let8W+6MxJ71My4opUZ2LkpGtZbBlYJnvf/smwEzWmRgsW/6EvI
         T5VA==
X-Gm-Message-State: AOAM533/Y9B1U89SaoftKddpQaaN5cwjVqVm4BT8oaZ5tjL/JXJHXcbt
        lkVWC8bKxSaKDNTtajdyPoUftk9j4nyixjgm/m0=
X-Google-Smtp-Source: ABdhPJxCWQ0KE6CcWjU6LKE+t8kq3+H3FOC564iNq8TlkZeU2+mvWAPTet5oud4syl6MBMRXzZtaEmUM8s2JW0HOMH4=
X-Received: by 2002:a05:6402:68f:: with SMTP id f15mr2680328edy.89.1589438094726;
 Wed, 13 May 2020 23:34:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aa7:c707:0:0:0:0:0 with HTTP; Wed, 13 May 2020 23:34:54
 -0700 (PDT)
Reply-To: bartolosimon105@outlook.com
From:   Bartolo Simon <mgeaaaaa25@gmail.com>
Date:   Thu, 14 May 2020 06:34:54 +0000
Message-ID: <CAGSHzsoJXQSekQXUQCzOu8Ypd59-iYzdLT_9d96fxrYk7zYQoQ@mail.gmail.com>
Subject: =?UTF-8?B?Ly8vLy9CdWVub3MgZMOtYXM=?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Te envi=C3=A9 un correo electr=C3=B3nico anteriormente sobre un proyecto qu=
e quiero
te conf=C3=ADo Soy Bartolo Simon, un paciente de c=C3=A1ncer seg=C3=BAn el =
informe.
y para m=C3=A1s detalles amablemente volver a m=C3=AD es muy importante.
