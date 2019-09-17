Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84EB9B5455
	for <lists+linux-omap@lfdr.de>; Tue, 17 Sep 2019 19:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbfIQRf2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Sep 2019 13:35:28 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:44186 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbfIQRf2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 Sep 2019 13:35:28 -0400
Received: by mail-io1-f68.google.com with SMTP id j4so9500050iog.11
        for <linux-omap@vger.kernel.org>; Tue, 17 Sep 2019 10:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=JHHEwesfK2iLZDx0apPoffR04w/omaTzddsEsubqJeE=;
        b=IHlx5bNvX5DjyizZaZasU4cVwGJNlq1FNHswa3s2cgV4MLebL6GajAkheADO+co/td
         VxhfqEDPlvPoCN9LiQtB4S2jXBZsJOnh/sc+zQ0PJkAbm4DnA07hKxGbreOBjEnkP43U
         ngfNmJcC/Z6hkMpMeM7292jOkVNMvcmOlHVTrouskZpRn5q0Q85gzeY5kQzytlm7coWb
         gT7VHtmYbS8dX4KtwpHztvsJVbzjV2gBJgiX6elR8bUuyOaWRhGqHVuOXMshdLEI4pzy
         F0Xl+2C7DUm1gGQELMYpSRhxDBcgGg8bKub4oIr9z6qavo7rB4CpmbOgRzKBKv2x1FzS
         Stnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=JHHEwesfK2iLZDx0apPoffR04w/omaTzddsEsubqJeE=;
        b=GwYlZpgRVkIMHNBuSufUVssajup8ikctdK+9+rV1HJCKx6Biwabfzs5KlCeB/uQxIl
         SowN53OrSY136jXvPBGRDFWdGe5hf9xbJuzNTcttqU+yJOBwmnd4GZeLEhxputpifhuP
         txB9SJzGwbTqqiTpGdewodkKeJh0s3NYV9r1Bxwiy2/VVHx/HiCbthuwmk13iZm+BOdf
         prAxQNQKD0iT6RtdCpqhdr4wD0Go1CPjQrK77DTNQEpKXmS9XtDZGu/Bj3sY91I50mU2
         mr/EY3sX0kfqrPQ0fTHgavShNvFtYj2VHzk0kNhsctzCOz0E+ge6qPSvO0EKpD7ZT3Jx
         H2jQ==
X-Gm-Message-State: APjAAAXb/OsCTgIcP9aN+IXb7YpOXXAUkCcDEPgz3/8yaWboOi2vGGTX
        vvaM22ywFuvbHqqmxWAb2w+kI9hYZeLhh434kYt4iJo22r8=
X-Google-Smtp-Source: APXvYqx2I0LPUqzc/fXAYaALiTtthBJoRLpdEUt6ZqTByOkB34IyIaIYLxG0ZV50uLn8HLNZXgpk33xPLQDRUdkLAIk=
X-Received: by 2002:a05:6638:3:: with SMTP id z3mr5044482jao.54.1568741726523;
 Tue, 17 Sep 2019 10:35:26 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 17 Sep 2019 12:35:15 -0500
Message-ID: <CAHCN7xL-DOtFg-o8JFvfGWHJCo4Jh7Qtaf8CoRxWmq_9aRRroQ@mail.gmail.com>
Subject: OMAP Maintainers
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Tony,

I was noticing the maintainers file lists a bunch of stuff that goes
through your branch

OMAP DEVICE TREE SUPPORT
M: Beno=C3=AEt Cousson <bcousson@baylibre.com>
M: Tony Lindgren <tony@atomide.com>
L: linux-omap@vger.kernel.org
L: devicetree@vger.kernel.org
S: Maintained
F: arch/arm/boot/dts/*omap*
F: arch/arm/boot/dts/*am3*
F: arch/arm/boot/dts/*am4*
F: arch/arm/boot/dts/*am5*
F: arch/arm/boot/dts/*dra7*


Unfortunately, none of the logicpd-torpedo/som-lv files fit this format.

Are you OK if I submit a patch to include them in your maintainer table?

adam
