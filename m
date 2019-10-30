Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 061BDE93FD
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2019 01:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbfJ3AFT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 29 Oct 2019 20:05:19 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36188 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbfJ3AFT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 29 Oct 2019 20:05:19 -0400
Received: by mail-pf1-f194.google.com with SMTP id v19so254596pfm.3;
        Tue, 29 Oct 2019 17:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WvXTUtOWyrkwX7azTO7rbSAR4UTRu1E5DcXaGc6shCQ=;
        b=Z8sZ+/9CWuIB+NRZa2AY729XXET4KqFV4mWVwvd/w0qA3mhk/rxi1ZGMdcC47TwFOE
         KEqtTwUdXuLRnicUxZHFgzU9keFYBASs+chskPVoL+CHkxWipAj+lpIALO9wFhmKo3Jo
         yv84gj0fGqBrnm+a+fIAp1PeosS9lxmDAl6/OAakI2YmlHruJZdBiwbq6ey3ZN80MSrO
         inPFeR3ydtbOX4AmnU/Turs8gNXJJohGbh98ycLlD0hnLMmRZnrzqq9lJ86pVrn58tld
         yyGhvQAsTsI0TjuQSaZbuyqMVh1ujcZ9oNdZtGViHor1XXfggMsIXSlN1t3PU66daeJW
         dAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WvXTUtOWyrkwX7azTO7rbSAR4UTRu1E5DcXaGc6shCQ=;
        b=VXxL4FZeD0S0iSnueloVPztgprGwo563Z4mvQmP93JQOxBfE2DGGbCfoUxBpu9ZPCV
         cvH5hvW3BSYPqVSicdL6rVYBFNG4VseyaIxzrRwSFB1LIJEzTjGjJCbVMGUgma/9aRoV
         vGeOynEW8I2rUHOO5qSbcNKgTn3Bv0UvLwG1crbTs6rw0EKcoZa5mkVZnegoY3e3wjyI
         H1/3wRL9viZbJHBXZmewkBQ5cEcmRAK08fpFAMFtxOPWO/uj+3N9Q5bdJ72AHRGp6Rid
         yiDTjXtHFpyCk0/zgkN6Mz3EOGaj91c8J0+a4IAUYZe2W1qEpLZRAHQSr47rK/m+Lems
         pi/Q==
X-Gm-Message-State: APjAAAVdxJTluM5Tqf7z7XevBWgsPaPcVDZ80N6zBi/UQYZv6eyxYZVg
        PqHh7zDrqvkyR7umuoIyA/yF2m5UyksYdIMHX5ZdgF1y
X-Google-Smtp-Source: APXvYqz1T0+DNc5PuJtF6z3x5mXkEIdv9EMYOSCsdBUtePzoi1xQlN9P5j2nn6SDiZFUfgreBtDWSlnbOwqbYrh/1HY=
X-Received: by 2002:a17:90a:dd43:: with SMTP id u3mr10287039pjv.130.1572393916127;
 Tue, 29 Oct 2019 17:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20191029135352.GA1486@techyauld.com>
In-Reply-To: <20191029135352.GA1486@techyauld.com>
From:   Yi Zheng <goodmenzy@gmail.com>
Date:   Wed, 30 Oct 2019 08:04:54 +0800
Message-ID: <CAJPHfYOxCS4oJ_aax-ZQUZsh4oLVqQgVuDz3w6RzubYGMFYLRA@mail.gmail.com>
Subject: [omap_hsmmc] run into dead loop
To:     linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     Zheng Yi <yzheng@techyauld.com>,
        =?UTF-8?B?5aea5Y2a?= <byao@techyauld.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

    I found that there may be a dead loop in omap-hsmmc driver:
    drivers/mmc/host/omap_hsmmc.c

    My testing is on v4.19.58-0-g7a6bfa08b938, but the latest
    kernel(v5.4-rc5-19-g8005803a2ca0) has the same bug(I guess).

    In omap_hsmmc_start_command(), the IRQ is enabled too early:
        omap_hsmmc_start_command(struct omap_hsmmc_host *host, struct
mmc_command *cmd,
                struct mmc_data *data)
        {
                /* ..................... */
                omap_hsmmc_enable_irq(host, cmd);

                /* ..................... */
                /*  If IRQ occurs here, we run in deadloop! */

                host->req_in_progress =3D 1;

                /* ..................... */
        }

    In OMAP-HSMMC ISR, the C code is:
        static irqreturn_t omap_hsmmc_irq(int irq, void *dev_id)
        {
                struct omap_hsmmc_host *host =3D dev_id;
                int status;

                status =3D OMAP_HSMMC_READ(host->base, STAT);
                while (status & (INT_EN_MASK | CIRQ_EN)) {
                        if (host->req_in_progress)
                                omap_hsmmc_do_irq(host, status);

                        if (status & CIRQ_EN)
                                mmc_signal_sdio_irq(host->mmc);

                        /* Flush posted write */
                        status =3D OMAP_HSMMC_READ(host->base, STAT);
                }

                return IRQ_HANDLED;
        }

    It checks the flag host->req_in_progress, only it is set,
    omap_hsmmc_do_irq() will be called.  The STAT register will be
    written in omap_hsmmc_do_irq(), that will cause the interrupts to
    be reset.

    If MMC IRQ occurs in that danger time-window, my single core CPU
    will run into endless loop in the ISR omap_hsmmc_irq(), due to
    STAT register is never written to clean the IRQ.

    Due to the small time-window, this bug is some what difficult to
    be found. I add some debug info dumpping in that two functions,
    that will cause the code slower, the bug will occur easier.  It is
    realy a bug. The debug version of the source and the debug log is
    some what tedious. I only add the snippet here:

    The bug log:
        [   12.765560] omap_hsmmc_runtime_resume:2354: omap_hsmmc
48060000.mmc: enabled
        [   12.773006] mmc_mrq_pr_debug:279: mmc0: starting CMD6 arg
03200101 flags 0000049d
        [   12.780941] omap_hsmmc_start_command:853: omap_hsmmc
48060000.mmc: mmc0: CMD6, argument 0x03200101
        [   12.790396] omap_hsmmc_start_command:859: omap_hsmmc
48060000.mmc: mmc0: CMD6, argument 0x03200101, tracing
        [   12.800662] omap_hsmmc_start_command:862: omap_hsmmc
48060000.mmc: mmc0: CMD6, argument 0x03200101, tracing
        [   12.811054] omap_hsmmc_start_command:871: omap_hsmmc
48060000.mmc: mmc0: CMD6, argument 0x03200101, tracing
        [   12.821331] omap_hsmmc_start_command:878: omap_hsmmc
48060000.mmc: mmc0: CMD6, argument 0x03200101, tracing
        [   12.831596] omap_hsmmc_start_command:888: omap_hsmmc
48060000.mmc: mmc0: CMD6, argument 0x03200101, tracing
        [   12.841861] omap_hsmmc_start_command:919: omap_hsmmc
48060000.mmc: mmc0: CMD6, argument 0x03200101, tracing
        [   12.852124] omap_hsmmc_start_command:923: omap_hsmmc
48060000.mmc: mmc0: CMD6, argument 0x03200101, tracing
        [   12.862393] omap_hsmmc_irq:1207: omap_hsmmc 48060000.mmc:
mmc0: enter ISR, irq=3D34, status=3D1
        [   12.871155] omap_hsmmc_do_irq:1157: omap_hsmmc
48060000.mmc: IRQ Status is 1
        [   12.878553] omap_hsmmc_irq:1226: omap_hsmmc 48060000.mmc:
mmc0: leave ISR, irq=3D34
        [   12.886450] omap_hsmmc_start_command:939: omap_hsmmc
48060000.mmc: mmc0: CMD6, tracing
        [   12.894805] CPU: 0 PID: 95 Comm: kworker/0:1H Tainted: G
    W  O      4.19.58-0-g7a6bfa08b-cp5502 #25
        [   12.904878] Hardware name: Generic AM33XX (Flattened Device Tree=
)
        [   12.911292] Workqueue: kblockd blk_mq_run_work_fn
        [   12.916316] [<c010f7fc>] (unwind_backtrace) from
[<c010ce4c>] (show_stack+0x18/0x1c)
        [   12.924506] [<c010ce4c>] (show_stack) from [<c0629cac>]
(omap_hsmmc_request+0x2b0/0x4b0)
        [   12.933014] [<c0629cac>] (omap_hsmmc_request) from
[<c06147b8>] (mmc_start_request+0xa4/0xb8)
        [   12.942015] [<c06147b8>] (mmc_start_request) from
[<c0614834>] (mmc_wait_for_req+0x68/0xd0)
        [   12.950828] [<c0614834>] (mmc_wait_for_req) from
[<c0614918>] (mmc_wait_for_cmd+0x7c/0xa4)
        [   12.959552] [<c0614918>] (mmc_wait_for_cmd) from
[<c061bbe0>] (__mmc_switch+0xe0/0x2cc)
        [   12.967998] [<c061bbe0>] (__mmc_switch) from [<c061bdf8>]
(mmc_switch+0x2c/0x34)
        [   12.975805] [<c061bdf8>] (mmc_switch) from [<c061be58>]
(mmc_flush_cache+0x58/0x84)
        [   12.983844] [<c061be58>] (mmc_flush_cache) from
[<c0626f84>] (mmc_blk_mq_issue_rq+0x5d8/0x76c)
        [   12.992927] [<c0626f84>] (mmc_blk_mq_issue_rq) from
[<c0627644>] (mmc_mq_queue_rq+0x158/0x1fc)
        [   13.002056] [<c0627644>] (mmc_mq_queue_rq) from
[<c0470590>] (blk_mq_dispatch_rq_list+0x384/0x4c4)
        [   13.011521] [<c0470590>] (blk_mq_dispatch_rq_list) from
[<c047531c>] (blk_mq_sched_dispatch_requests+0xfc/0x174)
        [   13.022248] [<c047531c>] (blk_mq_sched_dispatch_requests)
from [<c046f020>] (__blk_mq_run_hw_queue+0xcc/0x110)
        [   13.032793] [<c046f020>] (__blk_mq_run_hw_queue) from
[<c01520f0>] (process_one_work+0x364/0x64c)
        [   13.042142] omap_hsmmc_irq:1207: omap_hsmmc 48060000.mmc:
mmc0: enter ISR, irq=3D34, status=3D108000
        [   13.042156] omap_hsmmc_do_irq:1157: omap_hsmmc
48060000.mmc: IRQ Status is 108000
        [   13.042173] omap_hsmmc_dbg_report_irq:1088: omap_hsmmc
48060000.mmc: MMC IRQ 0x108000 : ERRI DTO
        [   13.042196] omap_hsmmc_irq:1226: omap_hsmmc 48060000.mmc:
mmc0: leave ISR, irq=3D34
        [   13.076452] [<c01520f0>] (process_one_work) from
[<c0153020>] (worker_thread+0x294/0x408)
        [   13.085089] [<c0153020>] (worker_thread) from [<c0158624>]
(kthread+0x140/0x15c)
        [   13.092861] [<c0158624>] (kthread) from [<c01010b4>]
(ret_from_fork+0x14/0x20)
        [   13.100482] Exception stack(0xdd179fb0 to 0xdd179ff8)
        [   13.105828] 9fa0:
00000000 00000000 00000000 00000000
        [   13.114411] 9fc0: 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000
        [   13.123032] 9fe0: 00000000 00000000 00000000 00000000
00000013 00000000
        [   13.130027] mmc_wait_for_req_done:433: mmc0: req failed
(CMD6): -110, cmd->retries=3D3, retrying...
        [   13.139390] omap_hsmmc_start_command:853: omap_hsmmc
48060000.mmc: mmc0: CMD6, argument 0x03200101
        [   13.148839] omap_hsmmc_start_command:859: omap_hsmmc
48060000.mmc: mmc0: CMD6, argument 0x03200101, tracing
        [   13.148855] omap_hsmmc_irq:1207: omap_hsmmc 48060000.mmc:
mmc0: enter ISR, irq=3D34, status=3D108000
        [   13.168274] omap_hsmmc 48060000.mmc: !! mmc0: ISR, irq=3D34,
update status: 108000, req_in_progress=3D0, loop=3D1
        [   13.178489] omap_hsmmc 48060000.mmc: !! mmc0: ISR, irq=3D34,
update status: 108000, req_in_progress=3D0, loop=3D2
        [   13.188704] omap_hsmmc 48060000.mmc: !! mmc0: ISR, irq=3D34,
update status: 108002, req_in_progress=3D0, loop=3D3
        [   13.198920] omap_hsmmc 48060000.mmc: !! mmc0: ISR, irq=3D34,
update status: 108002, req_in_progress=3D0, loop=3D4
        [   13.209135] omap_hsmmc 48060000.mmc: !! mmc0: ISR, irq=3D34,
update status: 108002, req_in_progress=3D0, loop=3D5
        [   13.219351] omap_hsmmc 48060000.mmc: !! mmc0: ISR, irq=3D34,
update status: 108002, req_in_progress=3D0, loop=3D6
        endless looping ..............
        [   26.754257] omap_hsmmc 48060000.mmc: !! mmc0: ISR, irq=3D34,
update status: 108002, req_in_progress=3D0, loop=3D1306
        yes, endless.....

   The source code with line number(to be a reference to the log info)
 omap_hsmmc.c:
        847   =E2=94=82 static void
        848   =E2=94=82 omap_hsmmc_start_command(struct omap_hsmmc_host *ho=
st,
struct mmc_command *cmd,
        849   =E2=94=82     struct mmc_data *data)
        850   =E2=94=82 {
        851   =E2=94=82     int cmdreg =3D 0, resptype =3D 0, cmdtype =3D 0=
;
        852   =E2=94=82
        853   =E2=94=82     dev_vdbg(mmc_dev(host->mmc), "%s: CMD%d, argume=
nt 0x%08x\n",
        854   =E2=94=82         mmc_hostname(host->mmc), cmd->opcode, cmd->=
arg);
        855   =E2=94=82     host->cmd =3D cmd;
        856   =E2=94=82
        857   =E2=94=82     omap_hsmmc_enable_irq(host, cmd);
        858   =E2=94=82
        859   =E2=94=82     dev_vdbg(mmc_dev(host->mmc), "%s: CMD%d, argume=
nt
0x%08x, tracing\n", mmc_hostname(host->mmc), cmd->opcode, cmd->arg);
        860   =E2=94=82
        861   =E2=94=82     host->response_busy =3D 0;
        862   =E2=94=82     dev_vdbg(mmc_dev(host->mmc), "%s: CMD%d, argume=
nt
0x%08x, tracing\n", mmc_hostname(host->mmc), cmd->opcode, cmd->arg);
        863   =E2=94=82
        864   =E2=94=82     if (cmd->flags & MMC_RSP_PRESENT) {
        865   =E2=94=82         if (cmd->flags & MMC_RSP_136){
        866   =E2=94=82             resptype =3D 1;
        867   =E2=94=82             dev_vdbg(mmc_dev(host->mmc), "%s: CMD%d=
,
argument 0x%08x, tracing\n", mmc_hostname(host->mmc), cmd->opcode,
cmd->arg);
        868   =E2=94=82         }else if (cmd->flags & MMC_RSP_BUSY) {
        869   =E2=94=82             resptype =3D 3;
        870   =E2=94=82             host->response_busy =3D 1;
        871   =E2=94=82             dev_vdbg(mmc_dev(host->mmc), "%s: CMD%d=
,
argument 0x%08x, tracing\n", mmc_hostname(host->mmc), cmd->opcode,
cmd->arg);
        872   =E2=94=82         } else {
        873   =E2=94=82             resptype =3D 2;
        874   =E2=94=82             dev_vdbg(mmc_dev(host->mmc), "%s: CMD%d=
,
argument 0x%08x, tracing\n", mmc_hostname(host->mmc), cmd->opcode,
cmd->arg);
        875   =E2=94=82         }
        876   =E2=94=82     }
        877   =E2=94=82
        878   =E2=94=82     dev_vdbg(mmc_dev(host->mmc), "%s: CMD%d, argume=
nt
0x%08x, tracing\n", mmc_hostname(host->mmc), cmd->opcode, cmd->arg);
        879   =E2=94=82
        880   =E2=94=82     /*
        881   =E2=94=82      * Unlike OMAP1 controller, the cmdtype does no=
t
seem to be based on
        882   =E2=94=82      * ac, bc, adtc, bcr. Only commands ending an o=
pen
ended transfer need
        883   =E2=94=82      * a val of 0x3, rest 0x0.
        884   =E2=94=82      */
        885   =E2=94=82     if (cmd =3D=3D host->mrq->stop)
        886   =E2=94=82         cmdtype =3D 0x3;
        887   =E2=94=82
        888   =E2=94=82     dev_vdbg(mmc_dev(host->mmc), "%s: CMD%d, argume=
nt
0x%08x, tracing\n", mmc_hostname(host->mmc), cmd->opcode, cmd->arg);
        889   =E2=94=82
        890   =E2=94=82     cmdreg =3D (cmd->opcode << 24) | (resptype << 1=
6) |
(cmdtype << 22);
        891   =E2=94=82
        892   =E2=94=82     if ((host->flags & AUTO_CMD23) &&
mmc_op_multi(cmd->opcode) &&
        893   =E2=94=82         host->mrq->sbc) {
        894   =E2=94=82         cmdreg |=3D ACEN_ACMD23;
        895   =E2=94=82
        896   =E2=94=82         dev_vdbg(mmc_dev(host->mmc), "%s: CMD%d,
argument 0x%08x, tracing\n", mmc_hostname(host->mmc), cmd->opcode,
cmd->arg);
        897   =E2=94=82
        898   =E2=94=82         OMAP_HSMMC_WRITE(host->base, SDMASA,
host->mrq->sbc->arg);
        899   =E2=94=82
        900   =E2=94=82         dev_vdbg(mmc_dev(host->mmc), "%s: CMD%d,
argument 0x%08x, tracing\n", mmc_hostname(host->mmc), cmd->opcode,
cmd->arg);
        901   =E2=94=82     }
        902   =E2=94=82     if (data) {
        903   =E2=94=82         dev_vdbg(mmc_dev(host->mmc), "%s: CMD%d,
argument 0x%08x, tracing\n", mmc_hostname(host->mmc), cmd->opcode,
cmd->arg);
        904   =E2=94=82
        905   =E2=94=82         cmdreg |=3D DP_SELECT | MSBS | BCE;
        906   =E2=94=82         if (data->flags & MMC_DATA_READ)
        907   =E2=94=82             cmdreg |=3D DDIR;
        908   =E2=94=82         else
        909   =E2=94=82             cmdreg &=3D ~(DDIR);
        910   =E2=94=82
        911   =E2=94=82         dev_vdbg(mmc_dev(host->mmc), "%s: CMD%d,
argument 0x%08x, tracing\n", mmc_hostname(host->mmc), cmd->opcode,
cmd->arg);
        912   =E2=94=82     }
        913   =E2=94=82
        914   =E2=94=82     if (host->use_dma)
        915   =E2=94=82         cmdreg |=3D DMAE;
        916   =E2=94=82
        917   =E2=94=82     host->req_in_progress =3D 1;
        918   =E2=94=82
        919   =E2=94=82     dev_vdbg(mmc_dev(host->mmc), "%s: CMD%d, argume=
nt
0x%08x, tracing\n", mmc_hostname(host->mmc), cmd->opcode, cmd->arg);
        920   =E2=94=82
        921   =E2=94=82     OMAP_HSMMC_WRITE(host->base, ARG, cmd->arg);
        922   =E2=94=82
        923   =E2=94=82     dev_vdbg(mmc_dev(host->mmc), "%s: CMD%d, argume=
nt
0x%08x, tracing\n", mmc_hostname(host->mmc), cmd->opcode, cmd->arg);
        924   =E2=94=82
        925   =E2=94=82     OMAP_HSMMC_WRITE(host->base, CMD, cmdreg);
        926   =E2=94=82
        927   =E2=94=82     if(6 =3D=3D cmd->opcode){
        928   =E2=94=82 #define my_dynamic_dev_dbg(dev, fmt, ...)          =
     \
        929   =E2=94=82         do {                            \
        930   =E2=94=82             DEFINE_DYNAMIC_DEBUG_METADATA(descripto=
r, fmt); \
        931   =E2=94=82             if (DYNAMIC_DEBUG_BRANCH(descriptor)){ =
     \
        932   =E2=94=82                 __dynamic_dev_dbg(&descriptor, dev,=
 fmt, \
        933   =E2=94=82                           ##__VA_ARGS__);   \
        934   =E2=94=82                 dump_stack();               \
        935   =E2=94=82             }                       \
        936   =E2=94=82         } while (0)
        937   =E2=94=82
        938   =E2=94=82         my_dynamic_dev_dbg(mmc_dev(host->mmc), "%s:
CMD%d, tracing\n",
        939   =E2=94=82                    mmc_hostname(host->mmc), cmd->op=
code);
        940   =E2=94=82 #undef my_dynamic_dev_dbg
        941   =E2=94=82     }
        942   =E2=94=82 }
       ................
       1200   =E2=94=82 static irqreturn_t omap_hsmmc_irq(int irq, void *de=
v_id)
       1201   =E2=94=82 {
       1202   =E2=94=82     struct omap_hsmmc_host *host =3D dev_id;
       1203   =E2=94=82     int status;
       1204   =E2=94=82     unsigned int  loop_count =3D 0;
       1205   =E2=94=82
       1206   =E2=94=82     status =3D OMAP_HSMMC_READ(host->base, STAT);
       1207   =E2=94=82     dev_vdbg(mmc_dev(host->mmc), "%s: enter ISR,
irq=3D%d, status=3D%x\n", mmc_hostname(host->mmc), irq, status);
       1208   =E2=94=82
       1209   =E2=94=82     while (status & (INT_EN_MASK | CIRQ_EN)) {
       1210   =E2=94=82         loop_count++;
       1211   =E2=94=82
       1212   =E2=94=82         if (host->req_in_progress)
       1213   =E2=94=82             omap_hsmmc_do_irq(host, status);
       1214   =E2=94=82
       1215   =E2=94=82         if (status & CIRQ_EN)
       1216   =E2=94=82             mmc_signal_sdio_irq(host->mmc);
       1217   =E2=94=82
       1218   =E2=94=82         /* Flush posted write */
       1219   =E2=94=82         status =3D OMAP_HSMMC_READ(host->base, STAT=
);
       1220   =E2=94=82         if(status){
       1221   =E2=94=82             dev_warn(mmc_dev(host->mmc), "!! %s: IS=
R,
irq=3D%d, update status: %x, req_in_progress=3D%d, loop=3D%u\n",
       1222   =E2=94=82                  mmc_hostname(host->mmc), irq, stat=
us,
host->req_in_progress, loop_count);
       1223   =E2=94=82         }
       1224   =E2=94=82     }
       1225   =E2=94=82
       1226   =E2=94=82     dev_vdbg(mmc_dev(host->mmc), "%s: leave ISR,
irq=3D%d\n", mmc_hostname(host->mmc), irq);
       1227   =E2=94=82     return IRQ_HANDLED;
       1228   =E2=94=82 }



    My patch to fixup that bug is here:
diff -upr linux-git/drivers/mmc/host/omap_hsmmc.c
linux-fixup/drivers/mmc/host/omap_hsmmc.c
--- linux-git/drivers/mmc/host/omap_hsmmc.c     2019-10-29
21:33:05.127638851 +0800
+++ linux-fixup/drivers/mmc/host/omap_hsmmc.c   2019-10-29
21:37:44.957637473 +0800
@@ -852,8 +852,6 @@ omap_hsmmc_start_command(struct omap_hsm
                mmc_hostname(host->mmc), cmd->opcode, cmd->arg);
        host->cmd =3D cmd;

-       omap_hsmmc_enable_irq(host, cmd);
-
        host->response_busy =3D 0;
        if (cmd->flags & MMC_RSP_PRESENT) {
                if (cmd->flags & MMC_RSP_136)
@@ -891,7 +889,8 @@ omap_hsmmc_start_command(struct omap_hsm
        if (host->use_dma)
                cmdreg |=3D DMAE;

-       host->req_in_progress =3D 1;
+       host->req_in_progress =3D 1; /* the flag must be set BEFORE irq ena=
bled */
+       omap_hsmmc_enable_irq(host, cmd);

        OMAP_HSMMC_WRITE(host->base, ARG, cmd->arg);
        OMAP_HSMMC_WRITE(host->base, CMD, cmdreg);



--
Brock Zheng <yzheng@techyauld.com>
=E9=83=91 =E7=A5=8E
